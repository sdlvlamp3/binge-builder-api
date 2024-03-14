class PlaylistsController < ApplicationController

    before_action :set_playlist, only: [:show, :update, :destroy]

    def index
        playlists = Playlist.all
        render json: PlaylistBlueprint.render(playlists, view: :normal)
    end
    
    def create
        playlist = Playlist.new(playlist_params)
        if playlist.save
            render json: PlaylistBlueprint.render(playlist, view: :extended), status: :created
        else
            render json: playlist.errors, status: :unprocessable_entity
        end
    end
    
    def show
        render json: PlaylistBlueprint.render(set_playlist, view: :extended), status: :ok
    end
    
    def update
        if set_playlist.update(playlist_params)
            render json: PlaylistBlueprint.render(set_playlist, view: :extended), status: :ok
        else
            render json: playlist.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        if set_playlist.destroy
            render json: { message: 'Successfully deleted playlist.' }
        else
            render json: { error: 'Unable to delete playlist.' }, status: :unprocessable_entity
        end
    end
    
    private
    
    def set_playlist
        playlist = Playlist.find(params[:id])
    end

    def playlist_params
        params.permit(:title, :description, :user_id)
    end
end


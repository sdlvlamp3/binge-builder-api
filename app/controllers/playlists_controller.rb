class PlaylistsController < ApplicationController
    
    before_action :set_playlist, only: [:show, :update, :destroy] 
    
    def index
        playlists = Playlist.all
        render json: PlaylistBlueprint.render(playlsit, view: :normal)
    end

    def show
        render json: PlaylistBlueprint.render(playlsit, view: :extended)
    end
    
    def create
        playlist = current_user.playlists.new(playlist_params)
        if playlist.save
            render json: PlaylistBlueprint.render(playlsit, view: :normal), status: :ok
        else
            render json: { error: 'Unable to create playlist.' }, status: :unprocessable_entity
        end
    end

    def update
        if playlist.update(playlist_params)
             render json: PlaylistBlueprint.render(playlsit, view: :normal)
        else
            render json: { error: 'Unable to update playlist.' }
        end
    end

    def destroy
        if playlists.destroy
            render json: { message: 'Successfully deleted playlist.' }
        else
            render json: { error: 'Unable to delete playlist.' }, status: :unprocessable_entity
        end
    end

    private

    def playlist_params
        params.permit(:title, :description, :user_id)
    end

    def set_playlist
        playlist = Playlist.find(params[:id])
    end
end


class PlaylistsController < ApplicationController
    def index
        playlists = Playlist.all
        render json: playlists
    end

    def show
        playlists = Playlist.find(params[:id])
        render json: playlists
    end
    
    def create
        playlist = current_user.playlists.new(playlist_params.except(:user_id))
        if playlist.save
            render json: playlist
        else
            render json: { error: 'Unable to create playlist.' }
        end
    end

    def update
        playlists = Playlist.find(params[:id])
        if playlist.update(playlist_params)
             render json: playlists
        else
            render json: { error: 'Unable to update playlist.' }
        end
    end

    def destroy
        playlists = Playlist.find(params[:id])
        if playlists.destroy
            render json: { message: 'Successfully deleted playlist.' }
        else
            render json: { error: 'Unable to delete playlist.' }
        end
    end

    private

    def playlist_params
        params.permit(:title, :description, :user_id)
    end
end


class MovieShowController < ApplicationController

    before_action :set_movie_show, only: [:show, :update, :destroy]

    def index
        movie_shows = MovieShow.all
        render json: MovieShowBlueprint.render(movie_shows, view: :normal)
    end
    
    def create
        movie_show = MovieShow.new(movie_show_params)
        if movie_show.save
            render json: MovieShowBlueprint.render(movie_show, view: :extended), status: :created
        else
            render json: movie_show.errors, status: :unprocessable_entity
        end
    end
    
    def show
        render json: MovieShowBlueprint.render(set_movie_show, view: :extended), status: :ok
    end
    
    def update
        if set_movie_show.update(playlist_params)
            render json: Movie_show_Blueprint.render(set_movie_show, view: :extended), status: :ok
        else
            render json: movie_show.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        if set_movie_show.destroy
            render json: { message: 'Successfully deleted playlist item.' }
        else
            render json: { error: 'Unable to delete playlist item.' }, status: :unprocessable_entity
        end
    end

    private

    def movie_show_params
        params.permit(:title, :description, :release_date, :playlist_id, :user_id)
    end

    def set_movie_show
        movie_show = MovieShow.find(params[:id])
    end
end
class GenreController < ApplicationController
    
    before_action :set_genre, only: [:show, :update, :destroy] 
    
    def index
        genres = Genre.all
        render json: GenreBlueprint.render(genres, view: :normal)
    end
    
    def create
        genre = Genre.new(genre_params)
        if genre.save
            render json: GenreBlueprint.render(genre, view: :extended), status: :created
        else
            render json: genre.errors, status: :unprocessable_entity
        end
    end
    
    def show
        render json: GenreBlueprint.render(set_genre, view: :extended), status: :ok
    end
    
    def update
        if set_genre.update(genre_params)
            render json: GenreBlueprint.render(set_genre, view: :extended), status: :ok
        else
            render json: genre.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        if set_genre.destroy
            render json: { message: 'Successfully deleted genre.' }
        else
            render json: { error: 'Unable to delete genre.' }, status: :unprocessable_entity
        end
    end
    
    private
    
    def set_genre
        genre = Genre.find(params[:id])
    end
    
# Only allow a list of trusted parameters through.
    def genre_params
        params.permit(:genre_type)
    end
end

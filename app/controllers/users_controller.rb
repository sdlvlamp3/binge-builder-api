class UsersController < ApplicationController

    before_action :set_user, only: [:show, :update, :destroy] 
    before_action :authenticate_request, except:[:create]

    def index
        users = User.all
        render json: UserBlueprint.render(users, view: :normal)
    end
    
    def create
        user = User.new(user_params)
        if user.save
            render json: UserBlueprint.render(user, view: :normal), status: :created
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: UserBlueprint.render(user, view: :extended), status: :ok
    end

    def update
        if user.update(user_params)
             render json: UserBlueprint.render(user, view: :normal)
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if user.destroy
            render json: { message: 'Successfully deleted user.' }
        else
            render json: { error: 'Unable to delete user.' }, status: :unprocessable_entity
        end
    end

    private

    def set_user
        user = User.find(params[:id])
    end

# Only allow a list of trusted parameters through.
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

# Handle "Record not found" globally for this controller.
    rescue_from ActiveRecord: :RecordNotFound do |exeption|
        Rails.logger.error exception.message
        render json: { error: 'User not found.'}, status: :not_found
    end
end

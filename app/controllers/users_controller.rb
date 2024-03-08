class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end
    
    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: { error: 'Unable to create user.' }
        end
    end

    def update
        user = User.find(params[:id])
        if user.udpate(user_params)
             render json: user
        else
            render json: { error: 'Unable to update user.' }
        end
    end

    def destroy
        user = User.find(params[:id])
        if user.destroy
            render json: { message: 'Successfully deleted user.' }
        else
            render json: { error: 'Unable to delete user.' }
        end
    end

    private

    def user_params
        params.permit(:username, :email, :password)
    end
end

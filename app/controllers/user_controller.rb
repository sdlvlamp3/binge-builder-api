class UserController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end
    
    def create
        @user = User.new(username:params[:username], email:params[:email], password:params[:password])
        if @user.save
            render json: @user
        else
            render json: { error: 'Unable to create user.' }
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.udpate(username: params[:username], email: params[:email])
             render json: @user
        else
            render json: { error: 'Unable to update user.' }
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json: { message: 'Successfully deleted user.' }
        else
            render json: { error: 'Unable to delete user.' }
        end
    end
end

class UsersController < ApplicationController
    before_action :authenticate_user
    before_action :set_user, only: [:show, :update, :destroy]
    
    def index
        @users = User.all
        render json: @users, each_serializer: UserSerializer
    end
    
    def show
        @user = User.find(params[:id])
        render json: @user, serializer: UserSerializer
    end
    
    def create
        @user = User.new(user_params)
        
        if @user.save
            render json: @user, status: :created, location: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    
    def update
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    
    
            
end
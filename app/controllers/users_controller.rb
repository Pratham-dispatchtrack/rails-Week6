class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @all_articles = @user.articles
    end

    def index
        @users = User.all
    end
    

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "user was created successfully. "
            redirect_to users_path(@user)
        else
            render 'new', status: 422
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "user was updated successfully"
            redirect_to users_path(@user)
        else
            render 'edit', status: 422
        end
    end



    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end

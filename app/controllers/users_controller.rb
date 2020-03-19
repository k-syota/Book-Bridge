class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
    else redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to user_path(@user.id)
    else
        @current_user = User.find(current_user.id)
        render "edit"
    end
  end

  def favorite
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id).all
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :email)
  end

end

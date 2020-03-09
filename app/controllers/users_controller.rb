class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id) #headerのユーザー名として定義
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
        redirect_to book_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :email)
  end
end

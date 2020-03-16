class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = User.find(current_user.id) #headerのユーザー名として定義
  end

  def show
    @current_user = User.find(current_user.id)
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id)
    # @reviews = @user.reviews
    @book = Book.where(user_id: @user.id)
    # binding.pry
  end

  def edit
    @current_user = User.find(current_user.id)
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

  def favorite
    @current_user = User.find(current_user.id)
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id).all
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :email)
  end

end

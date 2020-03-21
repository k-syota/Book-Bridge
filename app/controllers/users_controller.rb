class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.page(params[:page]).per(8)
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id).page(params[:page]).per(5)
    # @reviewsでuserのidを持つレビューを定義する
    # 定義されたレビューを.page(params[:page]).per(5)でページング機能を使い表示する
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
    @favorites = Favorite.where(user_id: @user.id).page(params[:page]).per(10)
    # @favoritesで@userのidを持つfavoritesを定義する
    # 定義されたを@favoritesを.page(params[:page]).per(5)でページング機能を使い表示する
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :email)
  end

end

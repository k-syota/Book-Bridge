class BooksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @user.id = current_user.id
  end

  def create
  end

  def index
  end

  def show
  end
end

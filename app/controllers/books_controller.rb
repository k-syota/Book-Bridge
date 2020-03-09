class BooksController < ApplicationController
  def new
    @current_user = User.find(current_user.id)
  end

  def create
  end

  def index
    @current_user = User.find(current_user.id)
  end

  def show
    @current_user = User.find(current_user.id)
  end
end

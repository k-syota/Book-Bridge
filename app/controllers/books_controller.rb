class BooksController < ApplicationController
  def new
    @current_user = User.find(current_user.id)
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # binding.pry
    @book.save!
    redirect_to book_path(@book)
  end

  def index
    @current_user = User.find(current_user.id)
    @books = Book.all
  end

  def show
    @current_user = User.find(current_user.id)
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:name, :user_id, :author_id)
  end
end

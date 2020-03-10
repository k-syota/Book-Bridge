class BooksController < ApplicationController
  def new
    @current_user = User.find(current_user.id)
    @book = Book.new
    @author = Author.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # binding.pry
    @author = Author.new(author_params)
    @author.book_id = @book.id
    @author.save
    @book.author_id = @author.id
    @book.save!
    @author.update(author_params)
    redirect_to book_path(@book)
  end

  def index
    @current_user = User.find(current_user.id)
    @books = Book.all
  end

  def show
    @current_user = User.find(current_user.id)
    @book = Book.find(params[:id])
    @author = Author.new
  end

  private

  def book_params
    params.require(:book).permit(:name, :user_id, :author_id)
  end

  def author_params
    params.require(:author).permit(:name, :book_id)
  end

end

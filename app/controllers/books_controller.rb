class BooksController < ApplicationController
  def new
    @current_user = User.find(current_user.id)
    @book = Book.new
    @review = Review.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # @book = current_user.books.new(book_params)
    @book.save!
    @review = Review.new(reviews_params)
    @review.book_id = @book.id
    @review.user_id = current_user.id
    @review.save
    redirect_to book_path(@book)
  end

  def index
    @current_user = User.find(current_user.id)
    @books = Book.all
    if params[:tag_name]
      @books = Book.tagged_with("#{params[:tag_name]}")
    end
  end

  def show
    @current_user = User.find(current_user.id)
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:name, :user_id, :author_id, :tag_list, :author_list, :genre_list)
  end

  def reviews_params
    params.require(:review).permit(:title, :text, :user_id, :book_id)
  end

end

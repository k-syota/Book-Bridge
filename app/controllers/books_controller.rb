class BooksController < ApplicationController
  def new
    @book = Book.new
    @book.reviews.build
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render "new"
    end
  end

  def index
    @books = Book.all
    if params[:tag_name]
      @books = Book.tagged_with("#{params[:tag_name]}")
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  private

  def book_params
    params.require(:book).permit(
      :name,
      :user_id,
      :author_id,
      :tag_list,
      :author_list,
      :genre_list,
      reviews_attributes:[:title, :text, :user_id, :book_id])
  end

  # def reviews_params
  #   params.require(:review).permit(:title, :text, :user_id, :book_id)
  # end

end

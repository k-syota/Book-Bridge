class AuthorsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    # binding.pry
    @author = @book.author.new(author_params)
    @author.save
    redirect_to book_path(@book)
  end

  def index

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
   def author_params
      params.require(:author).permit(:name, :book_id)
   end

end

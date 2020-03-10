class AuthorsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @author = @boo.author.new(author_params)
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

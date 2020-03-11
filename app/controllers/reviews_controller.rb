class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.save
    redirect_to book_path(@book)
  end

  def show
    @review = Review.find(params[:book_id])
    @current_user = User.find(current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def review_params
      params.require(:review).permit(:title, :text, :user_id, :book_id)
    end

end

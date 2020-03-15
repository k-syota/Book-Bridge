class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.save
    redirect_to book_path(@book)
  end

  def show
    @review = Review.find(params[:book_id])
    @user = @review.user
    # binding.pry
    @current_user = User.find(current_user.id)
  end

  def edit
    @current_user = User.find(current_user.id)
    @review = Review.find(params[:book_id])
  end

  def update
    @review = Review.find(params[:book_id])
    @review.update(review_params)
    redirect_to book_review_path(@review.id)
  end

  def destroy
    @review = Review.find(params[:book_id])
    @book = Book.find(params[:id])
    @review.destroy
    redirect_to book_path(@book)
  end

  private
    def review_params
      params.require(:review).permit(:title, :text, :user_id, :book_id)
    end

end

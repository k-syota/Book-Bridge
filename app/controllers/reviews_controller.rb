class ReviewsController < ApplicationController
  def create
  end

  def show
    @review = Review.find(params[:id])
    @book = @review.book
    @user = @review.user
    @search = Book.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
  end

  def edit
    @review = Review.find(params[:id])
    @search = Book.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
  end

  def update
    @review = Review.find(params[:id])
    @search = Book.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
    if @review.update(review_params)
       redirect_to book_review_path(@review.id)
    else
       render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @book = Book.find(params[:book_id])
    @review.destroy
    redirect_to book_path(@book)
  end

  private
    def review_params
      params.require(:review).permit(:title, :text, :user_id, :book_id)
    end

end

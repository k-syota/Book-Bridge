class HomesController < ApplicationController
before_action :authenticate_user!, only: []
  def top
    @search = Book.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
  end

  def about
    @search = Book.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
  end
end

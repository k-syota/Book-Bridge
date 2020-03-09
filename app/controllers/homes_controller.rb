class HomesController < ApplicationController
  def top
    @current_user = User.find(current_user.id)
  end

  def about
    @current_user = User.find(current_user.id)
  end
end

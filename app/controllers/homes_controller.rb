class HomesController < ApplicationController
before_action :authenticate_user!, only: []
  def top
  end

  def about
  end
end

class StaticPagesController < ApplicationController
  before_filter :not_signed_in_user

  def home
    @workout = current_user.workouts.build if signed_in?
    
  end

  def help
  end

  def about
  end

  def contact
  end

  def play
  end

end

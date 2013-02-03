class WorkoutsController < ApplicationController
	before_filter :signed_in_user

	def new
		@workout = current_user.workouts.build if signed_in?
	end

	def create
		@workout = current_user.workouts.build(params[:workout])
		if @workout.save
			flash[:success] = "Workout created!"
			redirect_to root_url
		else
			render 'static_pates/home'
		end
	end

	def destroy
	end
end

class ExerciseCategoriesController < ApplicationController
	before_filter :signed_in_user, 	only: [:new, :index, :edit, :update, :destroy]
	before_filter :admin_user, 		only: :destroy

	def new
		@exercise_categories = ExerciseCategory.all
		@exercise_category = ExerciseCategory.new
  	end

  	def create
    	@exercise_category = ExerciseCategory.new(params[:exercise_category])
  		@exercise_categories = ExerciseCategory.all
    if @exercise_category.save
      	flash[:success] = "Exercise Category Created"
    	redirect_to new_exercise_category_path
	    else
	      render 'new'
	    end
	end

	def destroy
		Exercise.find_exercise_category(params[:id]).destroy
		ExerciseCategory.find(params[:id]).destroy
		flash[:success] = "Exercise Category removed."
		redirect_to new_exercise_category_path
	end

	private
		def admin_user
			redirect_to(root_path) unless current_user.admin?
		end

		def signed_in_user
			store_location
			redirect_to signin_url, notice: "Please sign in." unless signed_in?
		end
end

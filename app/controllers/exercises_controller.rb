class ExercisesController < ApplicationController
	def new
		@exercise = ExerciseCategory.new.exercises.new
	end

	def show
		 @exercise = Exercise.find(params[:id])
	end

	def index
		#@exercises = Exercise.all
		@exercise = ExerciseCategory.new.exercises.new
		@exercises = Exercise.paginate(page: params[:page])
		@exercise_categories = ExerciseCategory.all
	end

  	def create
	  	@excat = ExerciseCategory.find(params[:exercise][:exercise_category_id])
	    @exercise = @excat.exercises.build(params[:exercise])

	    if @exercise.save
	    	#sign_in @user
	    	flash[:success] = "Exercise Saved"
	    	redirect_to exercises_path
	    else
	      render 'new'
	    end
  	end

  	def destroy
		Exercise.find(params[:id]).destroy
		flash[:success] = "Exercise removed"
		redirect_to exercises_path
  	end
end

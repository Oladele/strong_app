class WorkoutsController < ApplicationController
	before_filter :signed_in_user
	#before_filter :correct_user,   only: :destroy
	before_filter :correct_user, only: [:edit, :update, :destroy]

	def new
		@workout = current_user.workouts.build if signed_in?
		3.times { @workout.reps.build }
	end

	def create
		@workout = current_user.workouts.build(params[:workout])
		if @workout.save
			flash[:success] = "Workout created!"
			redirect_to root_url
		else
			#render 'static_pages/home'
			#render 'shared/error_messages'
			flash[:error] = "Error!"
			redirect_to root_url
		end
	end

	def edit
    #@user = User.find(params[:id])
    #Per 9.2.2 Now that the correct_user before filter defines @user, 
    #we can omit it from both actions (edit and update).
  end

  def update
    #@user = User.find(params[:id])
    #Per 9.2.2 Now that the correct_user before filter defines @user, 
    #we can omit it from both actions (edit and update).
    if @workout.update_attributes(params[:workout])
      flash[:success] = "Workout updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

	def destroy
		Workout.find(params[:id]).destroy
    	flash[:success] = "Workout removed."
    	redirect_to root_url
	end

	private

end

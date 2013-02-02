class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
    @workouts = @user.workouts.paginate(page: params[:page])
    
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
    	flash[:success] = "Welcome to the Sample App!"
    	redirect_to @user
    else
      render 'new'
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
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private
    def signed_in_user
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end

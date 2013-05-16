class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update, :destroy,:control_panel, :add_resume]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user, only: [:destroy,:control_panel,:add_admin, :add_eboard, :remove_admin, :remove_eboard]
  
  def show
    @user = User.find(params[:id])
    @resume = @user.resume
    @announcements = @user.announcements
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
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def update
    #@user = User.find(params[:id])
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

  def control_panel
    @users = User.all
  end

  def add_admin
    user = User.find(params[:id])
    user.admin = true
    if user.update_column(:admin, true)
      flash[:success] = "Added as Admin"
      redirect_to control_panel_path
    else
      flash[:error] = "Failed Adding Admin"

      redirect_to control_panel_path
    end
  end

  def remove_admin
    user = User.find(params[:id])
    if user.update_column(:admin, false)
      flash[:success] = "Removed as Admin"
      redirect_to control_panel_path
    else
      flash[:error] = "Failed removing Admin"
      redirect_to control_panel_path
    end
  end

  def add_eboard
    user = User.find(params[:id])
    if user.update_column(:eboard, true)
      flash[:success] = "Added as Eboard"
      redirect_to control_panel_path
    else
      flash[:error] = "Failed Adding Eboard"
      redirect_to control_panel_path
    end
  end

  def remove_eboard
    user = User.find(params[:id])
    if user.update_column(:eboard, false)
      flash[:success] = "Removed as Eboard"
      redirect_to control_panel_path
    else
      flash[:error] = "Failed removing Eboard"
      redirect_to control_panel_path
    end
  end


  private


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end

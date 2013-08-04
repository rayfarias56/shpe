class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update, :destroy,:control_panel]
  before_filter :correct_user,   only: [:edit, :update,:show]
  before_filter :admin_user, only: [:destroy,:control_panel,:add_admin, :add_eboard, :remove_admin, :remove_eboard]
  before_filter :company_user , only: [:index, :view_user]
  
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
    @user.updating_password = true
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to your profile!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.updating_password = true
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

  def view_user
    @user = User.find(params[:id])
    @resume = @user.resume
  end





end

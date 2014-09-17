class UsersController < ApplicationController
  before_filter :signed_in_user, except: [:new, :create]
  before_filter :correct_user, only: [:edit, :update, :show]
  before_filter :eboard_user, only: [:admin_tools]
  before_filter :admin_user, only: [:destroy]
  before_filter :company_user, only: [:index, :view_user]

  def show
    @user = User.find(params[:id])
    @resume = @user.resume
  end

  def admin_tools
    @user = current_user
    @announcements = @user.announcements
  end

  def new
    @user = User.new
  end


  def create_company user
    @user = user
    @user.company = true
    if @user.save
      flash[:success] = "Successfully created company user"
      redirect_to admin_tools_path
    else
      render 'new'
    end
  end

  def create
    @user = User.new(params[:user])
    @user.updating_password = true
    if current_user && current_user.admin?

      create_company @user
    else
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to your profile!"
        redirect_to @user
      else
        render 'new'
      end
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


  def view_user
    @user = User.find(params[:id])
    @resume = @user.resume
  end


  def settings
    @user = User.find(params[:id])
  end

  def set_alumnus
    @user = User.find(params[:id])
    if @user.update_attribute(:alumnus, params[:alumnus])
      flash[:success] = "Settings updated"
      sign_in @user
      redirect_to user_settings_path(@user)
    end

  end

  def group_index
    @group = params[:group]
    if @group == 'alumni' && current_user.alumnus?
      if  params[:major] && params[:major].present?
        @users = User.where(company: false, major: params[:major], alumnus: true)
      else
        @users = User.find_all_by_alumnus(true)
      end
    elsif @group == 'students' && (current_user.company? || current_user.admin? || current_user.eboard?)
      if  params[:major] && params[:major].present?
        @users = User.where(company: false, major: params[:major], alumnus: false)
      else
        @users = User.find_all_by_alumnus_and_company(false, false)
      end
    else
      redirect_to root_path
    end

  end


end


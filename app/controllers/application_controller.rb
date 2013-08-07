class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper


  private


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    unless current_user && current_user.admin?
      flash[:error] = 'You must sign in'
      redirect_to(root_path)
    end
  end

  def admin_user?
    current_user && current_user.admin?
  end

  helper_method :admin_user?

  def eboard_user?
    current_user && (current_user.eboard? || current_user.admin?)
  end

  helper_method :eboard_user?

  def company_user
    redirect_to(root_path) unless current_user.company?
  end

  def authenticate_admin!
    redirect_to new_session_path unless current_user.is_admin?
  end


  def eboard_user
    redirect_to(root_path) unless current_user.eboard? || current_user.admin?
  end


end

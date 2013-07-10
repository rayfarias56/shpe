class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper


  private


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def eboard_user
    redirect_to(root_path) unless current_user.eboard?
  end

  def company_user
    redirect_to(root_path) unless current_user.company?
  end
end

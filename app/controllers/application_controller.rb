class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper


  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception,
                :with => :render_error
    rescue_from ActiveRecord::RecordNotFound,
                :with => :render_not_found
    rescue_from ActionController::RoutingError,
                :with => :render_not_found
    rescue_from ActionController::UnknownController,
                :with => :render_not_found
    rescue_from ActionController::UnknownAction,
                :with => :render_not_found
  end

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
    current_user && current_user.eboard?
  end

  helper_method :eboard_user?

  def company_user
    redirect_to(root_path) unless current_user.company? || current_user.admin?
  end

  def authenticate_admin!
    redirect_to new_session_path unless current_user.is_admin?
  end


  def eboard_user
    redirect_to(root_path) unless current_user.eboard? || current_user.admin?
  end

  def elevated_user?
    current_user && (current_user.eboard? or current_user.admin?)
  end
  helper_method :elevated_user?

  protected

  def render_not_found(exception)
    render :template => "/errors/404.html.erb",
           :layout => 'errors.html.erb'
  end

  def render_error(exception)
    ExceptionNotifier::Notifier
    .exception_notification(request.env, exception)
    .deliver
    render :template => "/errors/500.html.erb",
           :layout => 'errors.html.erb'
  end

  def routing_error
    render_not_found(nil)
  end

end

class PasswordResetsController < ApplicationController


  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => "An email sent with password reset instructions."
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "The password reset has expired."
    elsif @user.update_attributes(params[:user])
      sign_in @user
      redirect_to @user, :notice => "Your password has been reset!"
    else
      render :edit
    end
  end


end

class EventUsersController < ApplicationController
  before_filter :signed_in_user
  before_filter :eboard_user

  def create
    user = User.find_by_uin(params[:uin])
    if user
      if EventUser.find_or_create_by_event_id_and_user_id(user_id: user.id, event_id: params[:event_id])
        render json: {message: 'You have successfully registered', status: 'success', name: user.name}
      else
        render json: {message: 'Error registering on server', status: 'error'}
      end
    else
      render json: {message: 'UIN not found. Please create an account.', status: 'error'}
    end
  end
end

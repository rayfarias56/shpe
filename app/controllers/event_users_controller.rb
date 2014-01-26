class EventUsersController < ApplicationController

  def create
    user = User.find_by_uin(params[:event_user][:uin])
    if user
      if EventUser.create(user_id: user, event_id: params[:event_user][:event_id])
        render json: {error: 'You have successfully registered', status: 'success'}
      else
        render json: {error: 'Error registering', status: 'error'}
      end
    else
      render json: {error: 'UIN not found', status: 'error'}
    end
  end
end

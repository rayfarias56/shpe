class EventUsersController < ApplicationController

  def create
    if User.find_by_uin(params[:uin])
      if EventUser.create(params)
        render json: {error: 'You have successfully registered', status: 'success'}
      else
        render json: {error: 'Error registering', status: 'error'}
      end
    else
      render json: {error: 'UIN not found', status: 'error'}
    end
  end
end

class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about

  end

  def contact

  end

  def mission

  end

  def meeting

  end

  def history

  end

  def constitution

  end

  def regioniv

  end

  def national

  end

  def documentary

  end

end

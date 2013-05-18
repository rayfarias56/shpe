class StaticPagesController < ApplicationController
  def home
    @announcements = Announcement.all(:limit => 3,:order => "created_at DESC")
   
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

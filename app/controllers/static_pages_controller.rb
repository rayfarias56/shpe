class StaticPagesController < ApplicationController
  def home
    @announcements = Announcement.all(:limit => 6,:order => "created_at DESC")
   
  end

  def help
  end

  def about

  end

  def contact

  end


  def events

  end

  def resources

  end

end

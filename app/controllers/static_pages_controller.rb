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
    @events = StaticPage.get_events
  end

  def resources

  end
  
  def members
    
  end

end

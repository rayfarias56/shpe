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

  def outreach
  end

  def history
  end

  def resources
  end
  
  def members
  end

  def sponsor_path
  end

  def faq
  end

  def committee_meeting_times
  end

  def external
  end

  def round_table
  end

  def fundraising
  end

  def membershpe
  end

  def publicity
  end

  def webdev
  end

  def community_service
  end

  def outreach
  end

  def technical
  end
  
end

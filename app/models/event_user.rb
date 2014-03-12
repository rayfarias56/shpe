class EventUser < ActiveRecord::Base
  attr_accessible :user_id, :event_id
  belongs_to :user
  belongs_to :event
end

class Event < ActiveRecord::Base
  attr_accessible :description, :end_time, :location, :name, :start_time
  has_many :event_users
  has_many :users, through: :event_users
end

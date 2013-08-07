class Event < ActiveRecord::Base
  attr_accessible :description, :end_time, :location, :name, :start_time
end

# == Schema Information
#
# Table name: announcements
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Announcement < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :as => [:default, :admin]

  validates :content, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
end

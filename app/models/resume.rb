# == Schema Information
#
# Table name: resumes
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  pdf_file_name    :string(255)
#  pdf_content_type :string(255)
#  pdf_file_size    :integer
#  pdf_updated_at   :datetime
#

class Resume < ActiveRecord::Base
  attr_accessible :pdf, :user_id
  has_attached_file :pdf

  validates_attachment :pdf, :presence => true,
  :content_type => { :content_type => "application/pdf" },
  :size => { :in => 0..10.megabytes }
  validates :user_id, presence: true

  belongs_to :user
end

class Resume < ActiveRecord::Base
  #attr_accessible :title, :body
  
  attr_accessible :pdf, :user_id
  has_attached_file :pdf
  validates_attachment :pdf, :presence => true,
  :content_type => { :content_type => "application/pdf" },
  :size => { :in => 0..10.megabytes }
  validates :user_id, presence: true

  belongs_to :user
end

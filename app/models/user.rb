# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#  gpa             :decimal(, )
#  major           :string(255)
#  resume_link     :string(255)
#  grad_date       :date
#  uin             :integer
#  phone_number    :string(255)
#  eboard          :boolean          default(FALSE)
#  company         :boolean          default(FALSE)
#

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ActiveRecord::Base
  #attr_accessible :email, :name, :password, :password_confirmation,:gpa,:major,:grad_date,:uin,:phone_number, as: :default
  attr_accessible :email, :name, :password, :password_confirmation,:gpa,:major,:grad_date,:uin,
                  :phone_number, :eboard, :company, :admin, :as => [:default, :admin ]
  has_secure_password
  has_one :resume
  has_many :announcements

  before_save { self.email.downcase! }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: false
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true
  validates :major, presence: true
  validates :grad_date, presence: true
  validates :uin, presence: true, length: {is: 9}, uniqueness:true, :numericality => true
  validates :phone_number, presence: true, length: {is: 10, :message => "should be 10 characters with no dashes"} , :numericality => true
  validates :gpa, :inclusion => { :in => 0..4, :message => "is not in the valid range" } , :numericality => true

  def send_password_reset
    generate_token(:password_reset_token)
    self.update_attribute(:password_reset_sent_at, Time.zone.now )
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end

class User < ActiveRecord::Base
  attr_accessible :first_name, :graduation_date, :last_name, :linkedin_link, :major, :password_hash, :username
end

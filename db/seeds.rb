# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.new(:name => 'Sean Freiburg', :password => 'blah1234', :password_confirmation => 'blah1234', :email => 'freibur1@illinois.edu', :gpa => 2.98, :major => 'Computer Science',:uin => 678802721, :phone_number => 2176173798, :grad_date => '2014/05/15')
user.admin = true
user.save
User.create(:name => 'Bill Guy', :password => 'blah1234', :password_confirmation => 'blah1234', :email => 'bevis@gmail.com', :gpa => 2.5, :major => 'Computer Science',:uin => 678802731, :phone_number => 2176173748, :grad_date => '2014/05/15', :company => true)
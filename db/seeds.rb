# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:name => 'Sean', :password => 'blah1234', :password_confirmation => 'blah1234', :email => 'frycicle@gmail.com', :admin => true)
User.create(:name => 'Bill', :password => 'blah1234', :password_confirmation => 'blah1234', :email => 'beavis@gmail.com')

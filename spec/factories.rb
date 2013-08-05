FactoryGirl.define do
  factory :user do
    name "Michael Hartl"
    email "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
    gpa 3.4
    major 'Computer Science'
    grad_date "2014/06/03"
    uin '678802722'
    phone_number '2176343798'
  end
end
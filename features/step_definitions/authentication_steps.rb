Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com", password: 'blah1234', password_confirmation: 'blah1234', :gpa => 2.5, :major => 'Computer Science',:uin => 678802721, :phone_number => 2176173798, :grad_date => '2014/05/15')
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^he should see his profile page$/ do
  page.should have_selector('h1', text: @user.name)
end

Then /^he should see a signout link$/ do
  page.should have_link('Sign Out', href: signout_path)
end
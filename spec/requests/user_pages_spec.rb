require 'spec_helper'

describe "UserPages" do
  subject {page}

  describe "signup page" do
  	before {visit signup_path}

  	it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirm Password", with: "foobar"
        fill_in "Gpa", with: "3.4"
        fill_in "Grad date", with: "2014/06/03"
        fill_in "Uin", with: '678802722'
        fill_in 'Phone number', with: '2176343798'
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign Out') }
      end


    end


    describe "with no information" do
          describe "after submission" do
            before { click_button submit }

            it { should have_selector('title', text: 'Sign up') }
            it { should have_content('error') }
          end
    end

    describe "with invalid information" do
      describe "after submission" do
        before do
          fill_in "Name",         with: "Example User"
          fill_in "Email",        with: "user@example.com"
          fill_in "Password",     with: "foobar"
          fill_in "Confirm Password", with: "foobar"
          fill_in "Gpa", with: "7"
          fill_in "Grad date", with: "2014/06/03"
          fill_in "Uin", with: '678802722'
          fill_in 'Phone number', with: '2176343798'
          click_button submit
        end

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
        end
      end
  end

end


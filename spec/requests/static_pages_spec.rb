require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do


    before { visit root_path }
    it { should have_selector('h1', :text => 'SHPE UIUC') }
    it { should have_selector('title',
                              :text => "SHPE UIUC") }

  end

  describe "Help page" do


      before { visit help_path }
      it {should have_selector('h1', :text => 'Help')   }
      it {should have_selector('title',
                                :text => "SHPE UIUC | Help")  }

  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit about_path
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit about_path
      page.should have_selector('title',
                                :text => "SHPE UIUC | About Us")
    end
  end

  describe "Contact page" do

    before { visit contact_path }
    it "should have the h1 'Contact Us'" do

      page.should have_selector('h1', :text => 'Contact Us')
    end

    it "should have the title 'Contact Us'" do
      visit contact_path
      page.should have_selector('title',
                                :text => "SHPE UIUC | Contact Us")
    end
  end

  describe "Mission & Vision page" do

    it "should have the h1 'Mission & Vision'" do
      visit mission_path
      page.should have_selector('h1', :text => 'Mission Statement')
    end

    it "should have the title 'Mission & Vision'" do
      visit mission_path
      page.should have_selector('title',
                                :text => "SHPE UIUC | Mission and Vision")
    end
  end
end
require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do


    before { visit root_path }
    it { should have_selector('p', :text => 'SHPE UIUC') }
    it { should have_selector('title',
                              :text => "SHPE UIUC") }

  end

  describe "Help page" do


    before { visit help_path }
    it { should have_selector('h1', :text => 'Help') }
    it { should have_selector('title',
                              :text => "SHPE UIUC | Help") }

  end

  describe "About page" do

    it "should have the h3 'About Us'" do
      visit about_path
      page.should have_selector('h3', :text => 'About Us')
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

  describe "Events page" do
    before { visit events_path }
    it "should have h1 'Events'" do
      page.should have_selector('h1', text: 'Events')
    end
    it "should have title 'Events'" do
      visit events_path
      page.should have_selector('title', text: "SHPE UIUC | Events")
    end
  end

  describe "Resources page" do
    before { visit resources_path }
    it "should have h1 'Resources'" do
      page.should have_selector('h1', text: 'Resources')
    end
    it "should have title 'Resources'" do
      visit resources_path
      page.should have_selector('title', text: "SHPE UIUC | Resources")
    end
  end

end
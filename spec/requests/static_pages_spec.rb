require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'SHPE UIUC'" do
      visit '/'
      page.should have_selector('h1', :text => 'SHPE UIUC')
    end

    it "should have the title 'SHPE UIUC'" do
      visit '/'
      page.should have_selector('title',
                        :text => "SHPE UIUC")
    end
  end

  describe "Help page" do

    it "should have the h1 'Help'" do
      visit '/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/help'
      page.should have_selector('title',
                        :text => "SHPE UIUC | Help")
    end
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit '/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit '/about'
      page.should have_selector('title',
                    :text => "SHPE UIUC | About Us")
    end
  end

  describe "Contacnt page" do

    it "should have the h1 'Contact Us'" do
      visit '/contact'
      page.should have_selector('h1', :text => 'Contact Us')
    end

    it "should have the title 'Contact Us'" do
      visit '/contact'
      page.should have_selector('title',
                    :text => "SHPE UIUC | Contact Us")
    end
  end
end
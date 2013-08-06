require 'spec_helper'

describe Announcement do

  before do
    @user = User.create(name: "Example User", email: "user@example.com", password: 'blah1234', password_confirmation: 'blah1234', :gpa => 2.5, :major => 'Computer Science',:uin => 674803421, :phone_number => 2176173798, :grad_date => '2014/05/15' )
    @announcement = @user.announcements.new( title: 'this is a title',content: 'this is the content')
  end

  subject { @announcement }

  it { should respond_to(:content) }
  it { should respond_to(:title) }
  it { should respond_to(:user_id) }


  it { should be_valid }


  describe "when title is not present" do
    before { @announcement.title = " " }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @announcement.content = " " }
    it { should_not be_valid }
  end

  describe "when title is nil" do
    before { @announcement.title = nil }
    it { should_not be_valid }
  end

  describe "when content is nil" do
    before { @announcement.content = nil }
    it { should_not be_valid }
  end

  describe "when user_id is nil" do
    before { @announcement.user_id = nil }
    it { should_not be_valid }
  end
end
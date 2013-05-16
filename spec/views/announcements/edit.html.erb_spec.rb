require 'spec_helper'

describe "announcements/edit" do
  before(:each) do
    @announcement = assign(:announcement, stub_model(Announcement,
      :user_id => 1,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit announcement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => announcements_path(@announcement), :method => "post" do
      assert_select "input#announcement_user_id", :name => "announcement[user_id]"
      assert_select "input#announcement_title", :name => "announcement[title]"
      assert_select "textarea#announcement_content", :name => "announcement[content]"
    end
  end
end

require 'spec_helper'

describe "announcements/show" do
  before(:each) do
    @announcement = assign(:announcement, stub_model(Announcement,
      :user_id => 1,
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end

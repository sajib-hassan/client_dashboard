require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        :ctoken => "Ctoken",
        :first_name => "First Name",
        :last_name => "Last Name"
      ),
      Client.create!(
        :ctoken => "Ctoken",
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "Ctoken".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end

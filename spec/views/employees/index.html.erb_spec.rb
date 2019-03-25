require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :identifier => "Identifier",
        :first_name => "First Name",
        :last_name => "Last Name",
        :company => nil
      ),
      Employee.create!(
        :identifier => "Identifier",
        :first_name => "First Name",
        :last_name => "Last Name",
        :company => nil
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "Identifier".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

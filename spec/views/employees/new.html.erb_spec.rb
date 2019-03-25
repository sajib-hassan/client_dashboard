require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      :identifier => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :company => nil
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[identifier]"

      assert_select "input[name=?]", "employee[first_name]"

      assert_select "input[name=?]", "employee[last_name]"

      assert_select "input[name=?]", "employee[company_id]"
    end
  end
end

require "rails_helper"

RSpec.describe("employees/new", type: :view) do
  before do
    assign(:employee, build(:employee))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do
      assert_select "input[name=?]", "employee[first_name]"

      assert_select "input[name=?]", "employee[last_name]"

      assert_select "select[name=?]", "employee[company_id]"
    end
  end
end

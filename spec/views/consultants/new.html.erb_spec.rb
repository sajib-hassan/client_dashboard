require 'rails_helper'

RSpec.describe "consultants/new", type: :view do
  before(:each) do
    assign(:consultant, Consultant.new(
      :client => nil,
      :contractor => nil,
      :employee => nil
    ))
  end

  it "renders new consultant form" do
    render

    assert_select "form[action=?][method=?]", consultants_path, "post" do

      assert_select "input[name=?]", "consultant[client_id]"

      assert_select "input[name=?]", "consultant[contractor_id]"

      assert_select "input[name=?]", "consultant[employee_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "consultants/edit", type: :view do
  before(:each) do
    @consultant = assign(:consultant, Consultant.create!(
      :client => nil,
      :contractor => nil,
      :employee => nil
    ))
  end

  it "renders the edit consultant form" do
    render

    assert_select "form[action=?][method=?]", consultant_path(@consultant), "post" do

      assert_select "input[name=?]", "consultant[client_id]"

      assert_select "input[name=?]", "consultant[contractor_id]"

      assert_select "input[name=?]", "consultant[employee_id]"
    end
  end
end

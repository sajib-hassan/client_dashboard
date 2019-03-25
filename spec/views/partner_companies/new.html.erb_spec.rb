require 'rails_helper'

RSpec.describe "partner_companies/new", type: :view do
  before(:each) do
    assign(:partner_company, PartnerCompany.new(
      :identity => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new partner_company form" do
    render

    assert_select "form[action=?][method=?]", partner_companies_path, "post" do

      assert_select "input[name=?]", "partner_company[identity]"

      assert_select "input[name=?]", "partner_company[name]"
    end
  end
end

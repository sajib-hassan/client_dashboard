require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    @company = create(:company)
    @second_company = create(:company)
    assign(:companies, [@company, @second_company])
  end

  it "renders a list of companies" do
    render
    assert_select 'tr>td', text: @company.identity.to_s, count: 1
    assert_select 'tr>td', text: @company.name.to_s, count: 2
  end
end

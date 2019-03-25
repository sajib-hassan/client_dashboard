require 'rails_helper'

RSpec.describe "partner_companies/index", type: :view do
  before(:each) do
    assign(:partner_companies, [
      PartnerCompany.create!(
        :identity => "Identity",
        :name => "Name"
      ),
      PartnerCompany.create!(
        :identity => "Identity",
        :name => "Name"
      )
    ])
  end

  it "renders a list of partner_companies" do
    render
    assert_select "tr>td", :text => "Identity".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

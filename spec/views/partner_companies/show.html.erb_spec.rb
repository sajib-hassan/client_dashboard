require 'rails_helper'

RSpec.describe "partner_companies/show", type: :view do
  before(:each) do
    @partner_company = assign(:partner_company, PartnerCompany.create!(
      :identity => "Identity",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Identity/)
    expect(rendered).to match(/Name/)
  end
end

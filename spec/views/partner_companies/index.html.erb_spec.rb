# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'partner_companies/index', type: :view do
  before(:each) do
    @partner_company = create(:partner_company)
    @second_partner_company = create(:partner_company)
    assign(:partner_companies, [@partner_company, @second_partner_company])
  end

  it 'renders a list of partner_companies' do
    render
    assert_select 'tr>td', text: @partner_company.identity.to_s, count: 1
    assert_select 'tr>td', text: @partner_company.name.to_s, count: 2
  end
end

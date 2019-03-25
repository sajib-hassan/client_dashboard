require 'rails_helper'

RSpec.describe "consultants/show", type: :view do
  before(:each) do
    @consultant = assign(:consultant, Consultant.create!(
      :client => nil,
      :contractor => nil,
      :employee => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

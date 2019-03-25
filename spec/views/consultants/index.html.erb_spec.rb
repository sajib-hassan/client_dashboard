require 'rails_helper'

RSpec.describe "consultants/index", type: :view do
  before(:each) do
    assign(:consultants, [
      Consultant.create!(
        :client => nil,
        :contractor => nil,
        :employee => nil
      ),
      Consultant.create!(
        :client => nil,
        :contractor => nil,
        :employee => nil
      )
    ])
  end

  it "renders a list of consultants" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

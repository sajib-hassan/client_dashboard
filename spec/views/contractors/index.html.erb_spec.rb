require "rails_helper"

RSpec.describe("contractors/index", type: :view) do
  before do
    @contractor = create(:contractor)
    @second_contractor = create(:contractor)
    assign(:contractors, [@contractor, @second_contractor])
  end

  it "renders a list of contractors" do
    render
    assert_select "tr>td", text: @contractor.first_name.to_s, count: 2
    assert_select "tr>td", text: @second_contractor.last_name.to_s, count: 2
  end

  it "renders a table with columns" do
    render
    assert_select "tr>th", text: "First Name", count: 1
    assert_select "tr>th", text: "Last Name", count: 1
    assert_select "tr>th", text: "Partner Company Identifier", count: 1
    assert_select "tr>th", text: "Clients", count: 1
  end
end

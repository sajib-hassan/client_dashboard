require "rails_helper"

RSpec.describe("companies/new", type: :view) do
  before do
    assign(:company, build(:company))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do
      assert_select "input[name=?]", "company[name]"
    end
  end
end

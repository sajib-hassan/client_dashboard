require "rails_helper"

RSpec.describe("clients/edit", type: :view) do
  before do
    @client = assign(:client, create(:client))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do
      assert_select "input[name=?]", "client[first_name]"

      assert_select "input[name=?]", "client[last_name]"
    end
  end
end

require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :ctoken => "Ctoken",
      :first_name => "First Name",
      :last_name => "Last Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ctoken/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Client, type: :model) do
  it "requires first name" do
    expect(build(:client, first_name: nil)).not_to(be_valid)
  end

  it "requires last name" do
    expect(build(:client, last_name: nil)).not_to(be_valid)
  end
end

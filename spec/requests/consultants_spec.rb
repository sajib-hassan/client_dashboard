require 'rails_helper'

RSpec.describe "Consultants", type: :request do
  describe "GET /consultants" do
    it "works! (now write some real specs)" do
      get consultants_path
      expect(response).to have_http_status(200)
    end
  end
end

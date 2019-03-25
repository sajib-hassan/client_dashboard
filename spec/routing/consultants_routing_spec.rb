require "rails_helper"

RSpec.describe ConsultantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/consultants").to route_to("consultants#index")
    end

    it "routes to #new" do
      expect(:get => "/consultants/new").to route_to("consultants#new")
    end

    it "routes to #show" do
      expect(:get => "/consultants/1").to route_to("consultants#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/consultants/1/edit").to route_to("consultants#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/consultants").to route_to("consultants#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/consultants/1").to route_to("consultants#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/consultants/1").to route_to("consultants#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/consultants/1").to route_to("consultants#destroy", :id => "1")
    end
  end
end

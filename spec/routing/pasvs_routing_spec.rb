require "rails_helper"

RSpec.describe PasvsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/pasvs").to route_to("pasvs#index")
    end

    it "routes to #new" do
      expect(:get => "/pasvs/new").to route_to("pasvs#new")
    end

    it "routes to #show" do
      expect(:get => "/pasvs/1").to route_to("pasvs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pasvs/1/edit").to route_to("pasvs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/pasvs").to route_to("pasvs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pasvs/1").to route_to("pasvs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pasvs/1").to route_to("pasvs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pasvs/1").to route_to("pasvs#destroy", :id => "1")
    end
  end
end

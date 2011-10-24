require "spec_helper"

describe EventsController do
  describe "routing" do

    it "routes to #new" do
      get("/").should route_to("events#new")
    end
    
    it "routes to #show" do
      get("/nicholas-pufal").should route_to("events#show", :token => "nicholas-pufal")
    end

  end
end

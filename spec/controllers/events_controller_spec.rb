require 'spec_helper'

describe EventsController do

  let :valid_attributes do
    Factory.attributes_for :event
  end

  describe "GET show" do
    it "assigns and find an event by token" do
      fake = double(Event)
      Event.should_receive(:find_by_token).with("joaozinho").and_return(fake)
      
      get :show, token: "joaozinho"
      
      assigns(:event).should eq(fake)
    end

  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new
      assigns(:event).should be_a_new(Event)
    end
  end

  describe "POST create" do
    
      describe "with valid params" do
    
        it "creates a new Event" do
          Event.should_receive(:new).and_return(mock_model(Event).as_null_object)
          post :create, :event => valid_attributes
        end
        
        it "saves the event" do
          event = mock_model(Event).as_null_object
          Event.stub(:new).and_return(event)
          event.should_receive(:save).and_return(true)
          
          post :create, :event => valid_attributes
        end

      end
  
      describe "with invalid params" do
        it "re-renders the 'new' template" do
          Event.any_instance.stub(:save).and_return(false)
          post :create, :event => {}
          response.should render_template("new")
        end
      end
    end
end

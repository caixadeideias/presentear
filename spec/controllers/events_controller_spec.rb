require 'spec_helper'

describe EventsController do

  let :valid_attributes do
    Factory.attributes_for :event
  end

  describe "GET show" do
    
    let(:fake) { double(Event).as_null_object }
    
    it "assigns and find an event by token" do
      Event.should_receive(:find_by_token).with("joaozinho").and_return(fake)
      get :show, token: "joaozinho"
      
      assigns(:event).should eq(fake)
    end
    
    it "should only show active events" do
      Event.stub(:find_by_token).and_return(fake)
      fake.should_receive(:active?)
      
      get :show, token: "joaozinho"
    end
    
    it "should show the expired template when event expired" do
      Event.stub(:find_by_token).and_return(fake)
      fake.stub(:active?).and_return false
      
      get :show, token: "joaozinho"
      response.should render_template "events/_expired"
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

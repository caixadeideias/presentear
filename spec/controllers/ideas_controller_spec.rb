require 'spec_helper'
require 'ostruct'

describe IdeasController do
  
  describe "POST create" do
    
    context "is valid" do
      
        before(:each) do
          @event = mock().as_null_object
          Event.stub(:find_by_token).and_return(@event)     
            
          Idea.any_instance.stub(:save).and_return(true)
        end
        
        it "should locate the related event by token" do
          @event = OpenStruct.new(:token => "joaozinho") 
          Event.should_receive(:find_by_token).with(@event.token).and_return(mock().as_null_object)
          
          post :create, {:token => @event.token }
        end

        it "should add the idea to the event" do  
          @event.should_receive(:ideas).and_return(@event)
          @event.should_receive(:build).and_return(@event)

          post :create, { :token => @event.token }
        end

        it "should redirect to the related event page" do            
          post :create, {:token => @event.token }
          
          response.should redirect_to show_event_path(@event.token)
        end
    end
    
    context "not valid" do
      
      before(:each) do
        @event = mock().as_null_object
        Event.stub(:find_by_token).and_return @event
        Idea.any_instance.stub(:save).and_return(false)
      end
      
      it "should redirect to the related event page" do    
        post :create, {:token => @event.token}
        
        response.should redirect_to show_event_path(@event.token)
      end
      
    end
    
  end

end
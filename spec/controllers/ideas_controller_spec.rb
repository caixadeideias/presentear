require 'spec_helper'

describe IdeasController do
  
  let(:fake_idea) { Factory(:idea) }
  let(:event_token) { fake_idea.event.token }

  describe "POST create" do
    
    context "is valid" do
        before(:each) do
          Idea.any_instance.stub(:save).and_return(true)
        end
        
        it "should locate the related event by token" do
          Event.should_receive(:find_by_token).with(event_token).and_return(mock().as_null_object)
          post :create, {:token => event_token, :idea => fake_idea.attributes }
        end

        it "should add the idea to the event" do
          object = mock().as_null_object
          Event.stub(:find_by_token).and_return(object)   

          object.should_receive(:ideas).and_return(object)
          object.should_receive(:build).and_return(object)

          post :create, {:token => event_token, :idea => fake_idea.attributes }
        end

        it "should redirect to the related event page" do        
          post :create, {:token => event_token, :idea => fake_idea.attributes }
          response.should redirect_to show_event_path(fake_idea.event.token)
        end
    end
    
    context "not valid" do
      before(:each) do
        Idea.any_instance.stub(:save).and_return(false)
      end
      
      it "should redirect to the related event page" do        
        post :create, {:token => Factory(:event).token, :idea => {} }
        response.should redirect_to show_event_path(event_token)
      end
      
      it "should not save the empty idea" do        
        expect { 
          post :create, {:token => Factory(:event).token, :idea => {} } 
        }.not_to change { Idea.count }
      end
      
    end
    
  end

end
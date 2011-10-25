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
    
  end

end



# 
# def create
#   @post = Post.find(params[:post_id])
#   @comment = @post.comments.build(params[:comment])
#   flash[:alert] = 'Fail to receive the comment. Double check the fields' unless @comment.save
#   
#   respond_to do |format|
#     format.html { redirect_to post_path(@post) }
#     format.js
#   end
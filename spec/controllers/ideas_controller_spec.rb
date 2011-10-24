require 'spec_helper'

# ARRUMAR ROTAS...

describe IdeasController do
  
  let(:fake_idea) { Factory(:idea) }
  let(:event_token) { fake_idea.event.token }

  describe "POST create" do
    
      before(:each) do
        Idea.any_instance.stub(:save).and_return(true)
      end
    
      it "should locate the related event" do
        Event.should_receive(:find).with(event_token).and_return(mock().as_null_object)
        
        post :create, {:token => event_token, :idea => fake_idea.attributes }
      end
    
      it "should add the idea to the event" do
        object = mock().as_null_object
        Event.stub(:find).and_return(object)   
         
        object.should_receive(:ideas).and_return(object)
        object.should_receive(:build).and_return(object)
      
        post :create, {:token => event_token, :idea => fake_idea.attributes }
      end
    
      it "should redirect to the related event page" do
        response.should render_template show_event_path(fake_idea.event)
        
        post :create, {:token => event_token, :idea => fake_idea.attributes }
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
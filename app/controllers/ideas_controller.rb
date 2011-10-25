class IdeasController < ApplicationController

  def create
    @event = Event.find_by_token(params[:token])
    @idea = @event.ideas.build(params[:idea])
    @idea.save
    redirect_to show_event_path(@event.token) 
  end

end

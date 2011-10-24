class IdeasController < ApplicationController
  def new
  end

  def create
    @event = Event.find(params[:event_id])
    @idea = @event.ideas.build(params[:idea])
    @idea.save
    redirect_to show_event_path(@event.token)
  end

end

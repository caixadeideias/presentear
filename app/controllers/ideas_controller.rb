class IdeasController < ApplicationController
  def new
  end

  def create
    @event = Event.find_by_token(params[:token])
    @idea = @event.ideas.build(params[:idea])
    redirect_to show_event_path(@event.token) if @idea.save
  end

end

class EventsController < ApplicationController

  def show
    @event = Event.find_by_token(params[:token])
    render :template => "events/_expired" unless @event.active?
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    
    if @event.save
      redirect_to show_event_path(@event.token)
    else
      render :new
    end
    
  end  
end

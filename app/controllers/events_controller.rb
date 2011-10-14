class EventsController < ApplicationController
  # GET /events/1
  def show
    @event = Event.find_by_token(params[:token])
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
  end

  # POST /events
  def create
    Event.create(params[:event])
    redirect_to :show
  end  
end

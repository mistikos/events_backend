class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_admin.events.new(params_event)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def params_event
    params.require(:event).permit(:name, :start_at, :duration, :place)
  end
end
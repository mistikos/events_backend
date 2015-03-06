class EventsController < ApplicationController
  def index
    # @events = current_admin.events.includes(:companies, :clients, :creator).paginate(:page => params[:page], :per_page => 12).order(:start_at)
    @events = current_admin.events.includes(:companies, :clients, :creator).paginate(:page => params[:page], :per_page => 12).order(:start_at)
  end

  def show
    @event = Event.includes(:companies, :clients).find(params[:id])
  end

  def new
    @event = Event.new(start_at: Time.zone.now)
  end

  def create
    @event = current_admin.events.new(params_event)
    @event.company_id = current_admin.company_id
    if @event.save
      @event.participants.create(company_id: current_admin.company_id)
      flash[:success] = "Evento creado!"
      redirect_to @event
    else
      render 'new'
    end
  end


  private

  def params_event
    params.require(:event).permit(:name, :start_at, :duration, :place, :latitude, :longitude, :address, :location, :description, :event_type_id)
  end
end
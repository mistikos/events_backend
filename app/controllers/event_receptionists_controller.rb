class EventReceptionistsController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @event = Event.find(params[:event_id])
    @event_receptionist = @event.event_receptionists.build(params_event_receptionist)
    if @event_receptionist.save
      flash[:success] = "Invitado agregado!"
      redirect_to @event
    else
      flash[:error] = "Ocurrio un error!"
      redirect_to @event
    end
  end

  private
  def params_event_receptionist
    params.require(:event_receptionist).permit(:receptionist_id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
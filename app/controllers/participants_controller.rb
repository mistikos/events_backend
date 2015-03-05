class ParticipantsController < ApplicationController
  def index
  end

  def new
    @event = Event.new(start_at: Time.zone.now)
  end

  def create
    @event = Event.find(params[:event_id])
    @participant = @event.participants.build(params_participant)
    if @participant.save
      flash[:success] = "Participante agregado!"
      redirect_to @event
    else
      flash[:alert] = "Ocurrio un error!"
      redirect_to @event
    end
  end

  private
  def params_participant
    params.require(:participant).permit(:company_id)
  end
end
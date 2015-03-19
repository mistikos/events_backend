class ParticipantsController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def index
  end

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @participant = @event.participants.build(params_participant)
    if @participant.email.present?
      redirect_to @event
      flash[:success] = "Se envió correctament el correo"
    else
      if @participant.save
        flash[:success] = "Participante agregado!"
        redirect_to @event
      else
        flash[:error] = "Ocurrio un error!"
        redirect_to @event
      end
    end
  end

  private
  def params_participant
    params.require(:participant).permit(:company_id, :email)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
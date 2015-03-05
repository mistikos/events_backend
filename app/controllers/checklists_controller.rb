class ChecklistsController < ApplicationController

  def new
    @event = Event.new(start_at: Time.zone.now)
  end

  def create
    @event = Event.find(params[:event_id])
    @checklist = @event.checklists.build(params_checklist)
    if @checklist.save
      flash[:success] = "Invitado agregado!"
      redirect_to @event
    else
      flash[:alert] = "Ocurrio un error!"
      redirect_to @event
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    @checklist = Checklist.find(params[:id])
    @checklist.destroy
    redirect_to event
  end

  private
  def params_checklist
    params.require(:checklist).permit(:client_id)
  end
end
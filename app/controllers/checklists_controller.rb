class ChecklistsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @event = Event.find(params[:event_id])
    @checklist = @event.checklists.build(params_checklist)
    @checklist.company_id = current_admin.company_id
    if @checklist.save
      flash[:success] = "Invitado agregado!"
      redirect_to @event
    else
      flash[:error] = "Ocurrio un error!"
      redirect_to @event
    end
  end

  def add
    @event = Event.find(params[:event_id])
    @checklist = @event.checklists.build(params_checklist)

    @shops = Shop.find params[:wine].delete[:shops]
    @wine = Wine.new(params[:wine])
    @wine.shops = @shops

    respond_to do |format|
      format.html
      format.js
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
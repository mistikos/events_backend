class ClientsController < ApplicationController

  def index
    @clients = current_company.clients.order(created_at: :desc)
  end

  def new
    @client = Client.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @client = current_admin.clients.new(params_client)
    @client.company_id = current_admin.company_id
    if @client.save
      flash[:success] = "Cliente creado!"
      redirect_to clients_path
    else
      render 'new'
    end
  end


  private
  def params_client
    params.require(:client).permit(:fullname, :dni, :email, :gender, :company_ids => [])
  end
end
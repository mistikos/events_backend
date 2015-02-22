class ClientsController < ApplicationController

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
    @client.save
  end


  private
  def params_client
    params.require(:client).permit(:fullname, :dni, :email, :gender)
  end
end
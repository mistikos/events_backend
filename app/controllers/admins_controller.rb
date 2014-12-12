class AdminsController < ApplicationController
  def show
    @profile = Admin.find(params[:id])
  end
end

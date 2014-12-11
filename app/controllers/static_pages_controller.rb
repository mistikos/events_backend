class StaticPagesController < ApplicationController
  def home
    if admin_signed_in?
      # @events = current_user.events
      @events = "Lista de eventos"
    end
  end
end

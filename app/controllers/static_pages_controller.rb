class StaticPagesController < ApplicationController
  def home
    if admin_signed_in?
      @feed_events = current_admin.events
    end
  end
end

module EventHelper
  def event_status_class(start_at)
    if start_at < Time.zone.now
      'inactive'
    else
      'active'
    end
  end
end
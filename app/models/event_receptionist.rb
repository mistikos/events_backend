class EventReceptionist < ActiveRecord::Base

  belongs_to :event
  belongs_to :receptionist

  validates :event_id, :receptionist_id, presence: true

end

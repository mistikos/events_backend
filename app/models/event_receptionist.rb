class EventReceptionist < ActiveRecord::Base

  belongs_to :event
  belongs_to :receptionist, class_name: 'User'

  validates :event_id, :receptionist_id, presence: true

end

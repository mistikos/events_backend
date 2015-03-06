class Checklist < ActiveRecord::Base
  belongs_to :event
  belongs_to :client

  validates :client_id, :event_id, presence: true
  validates :client_id, uniqueness: { scope: :event_id, message: "Ya elegiste el cliente" }

end

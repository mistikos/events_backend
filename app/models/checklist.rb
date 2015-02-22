class Checklist < ActiveRecord::Base
  belongs_to :event
  belongs_to :client
  validates :client, uniqueness: { scope: :event, message: "Ya elegiste el cliente" }
end

class EventType < ActiveRecord::Base

  validates :name, presence: true

end

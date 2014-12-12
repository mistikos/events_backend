class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'Admin'
  validates :name, presence: true
end

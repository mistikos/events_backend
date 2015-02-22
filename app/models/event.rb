class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'Admin'
  has_many :participants
  has_many :companies, through: :participants

  has_many :checklists
  has_many :clients, through: :checklists

  validates :name, presence: true
  validates :start_at, presence: true

  def full_address
    "#{locality} - #{address}"
  end
end

class Event < ActiveRecord::Base

  belongs_to :creator, class_name: 'Admin'
  has_many :participants
  has_many :companies, through: :participants
  has_many :checklists
  has_many :clients, through: :checklists

  validates :name, :slug, :start_at, presence: true
  validates :slug, uniqueness: true

  before_validation :generate_slug

  def generate_slug
    self.slug = "#{name}-#{Time.current.to_i}"
  end

  def full_address
    "#{address} - #{location}"
  end

end
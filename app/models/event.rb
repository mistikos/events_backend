class Event < ActiveRecord::Base

  belongs_to :creator, class_name: 'Admin'
  belongs_to :event_type
  has_many :participants, dependent: :destroy
  has_many :companies, through: :participants
  has_many :checklists
  has_many :clients, through: :checklists
  has_many :event_receptionists
  has_many :receptionists, class_name: 'User', through: :event_receptionists

  validates :name, :slug, :start_at, presence: true
  validates :slug, uniqueness: true

  before_validation :generate_slug

  delegate :name, to: :event_type, prefix: true
  scope :past, -> { where("start_at < ?", Time.zone.now) }
  scope :coming, -> { where("start_at >= ?", Time.zone.now) }

  def generate_slug
    self.slug = "#{name.parameterize}-#{Time.current.to_i}"
  end

  def full_address
    "#{address} - #{location}"
  end

end
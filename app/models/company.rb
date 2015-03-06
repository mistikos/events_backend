class Company < ActiveRecord::Base

  belongs_to :category
  has_many :company_has_receptionists
  has_many :receptionists, class_name: 'User', through: :company_has_receptionists
  has_many :client_has_companies
  has_many :clients, through: :client_has_companies
  has_many :participants
  has_many :events, through: :participants

  validates :name, :email, :category_id, presence: true, uniqueness: true
  validates :category_id, presence: true

end

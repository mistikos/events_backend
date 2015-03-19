class Client < ActiveRecord::Base

  belongs_to :creator, class_name: 'Admin'
  belongs_to :company
  has_many :client_has_companies
  has_many :companies, through: :client_has_companies

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :fullname, :company_id, :creator_id, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :dni, presence: true, uniqueness: true

end
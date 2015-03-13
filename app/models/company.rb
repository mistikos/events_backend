class Company < ActiveRecord::Base

  LOGO_URLS = ['https://d13yacurqjgara.cloudfront.net/users/6237/avatars/normal/photo1.jpg?1404262407', 'https://d13yacurqjgara.cloudfront.net/users/13157/avatars/normal/profile.jpeg?1402476363', 'https://d13yacurqjgara.cloudfront.net/users/469158/avatars/normal/Untitled-4.jpg?1403172039', 'https://d13yacurqjgara.cloudfront.net/users/354150/avatars/normal/cb28ad0d88d19d2061b4c29f6320e7db.jpg?1424626270', 'https://d13yacurqjgara.cloudfront.net/users/453701/avatars/normal/23675feba7e038376a25fc15b940cf18.jpg?1414347217', 'https://d13yacurqjgara.cloudfront.net/users/262590/avatars/normal/fe089668592dd18c438369e357e5e70d.jpg?1421845383']

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

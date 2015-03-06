class Company < ActiveRecord::Base

  belongs_to :category

  validates :name, :email, :category_id, presence: true
  validates :name, :email, uniqueness: true

end
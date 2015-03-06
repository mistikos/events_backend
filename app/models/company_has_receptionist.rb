class CompanyHasReceptionist < ActiveRecord::Base

  belongs_to :company
  belongs_to :receptionist, class_name: 'User'

  validates :company_id, :receptionist_id, presence: true

end

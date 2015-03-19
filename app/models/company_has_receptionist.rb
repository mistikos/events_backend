class CompanyHasReceptionist < ActiveRecord::Base

  belongs_to :company
  belongs_to :receptionist, class_name: 'User'

end

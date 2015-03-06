class ClientHasCompany < ActiveRecord::Base

  belongs_to :client
  belongs_to :company

  validates :client_id, :company_id, presence: true

end

class ClientHasCompany < ActiveRecord::Base

  belongs_to :client
  belongs_to :company

end

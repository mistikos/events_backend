class Participant < ActiveRecord::Base
  belongs_to :event
  belongs_to :company
  validates :company, uniqueness: { scope: :event, message: "Ya elegiste la empresa" }
end

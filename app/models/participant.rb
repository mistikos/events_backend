class Participant < ActiveRecord::Base

  attr_accessor :email

  belongs_to :event
  belongs_to :company

  validates :event, presence: true, if: :send_email?
  validates :company, presence: true, if: :send_email?

  validates :company, uniqueness: { scope: :event, message: "Ya elegiste la empresa" }

  def send_email?
    email == ""
  end

end

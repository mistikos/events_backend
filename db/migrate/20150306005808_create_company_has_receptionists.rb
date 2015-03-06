class CreateCompanyHasReceptionists < ActiveRecord::Migration
  def change
    create_table :company_has_receptionists do |t|
      t.belongs_to :company, index: true, null: false
      t.belongs_to :receptionist, index: true, null: false

      t.timestamps
    end
  end
end

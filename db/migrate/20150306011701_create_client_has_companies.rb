class CreateClientHasCompanies < ActiveRecord::Migration
  def change
    create_table :client_has_companies do |t|
      t.belongs_to :client, index: true, null: false
      t.belongs_to :company, index: true, null: false

      t.timestamps
    end
  end
end

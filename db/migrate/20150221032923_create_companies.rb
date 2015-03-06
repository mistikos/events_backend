class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :address
      t.string :phone
      t.string :logo
      t.belongs_to :category, null: false

      t.timestamps
    end
  end
end

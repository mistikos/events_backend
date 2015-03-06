class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :fullname, null: false
      t.string :dni, null: false
      t.string :email, null: false
      t.string :gender
      t.belongs_to :creator, index: true, null: false
      t.belongs_to :company, index: true, null: false

      t.timestamps
    end
  end
end

class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :fullname
      t.string :dni
      t.string :email
      t.belongs_to :company, index: true
      t.string :gender
      t.belongs_to :creator, index: true

      t.timestamps
    end
  end
end

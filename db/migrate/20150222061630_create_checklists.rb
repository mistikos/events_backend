class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.boolean :check_in, default: false, null: false
      t.string :place_reserved
      t.belongs_to :event, index: true, null: false
      t.belongs_to :client, index: true, null: false
      t.integer :recepcionist_id, null: true
      t.datetime :check_in_on, null: true
      t.timestamps
    end
  end
end

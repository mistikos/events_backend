class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.boolean :check_in, default: false, null: false
      t.string :place_reserved
      t.belongs_to :event, index: true, null: false
      t.belongs_to :client, index: true, null: false
      t.belongs_to :recepcionist, index: true
      t.datetime :check_in_at
      t.belongs_to :company, index: true, null: false
      t.timestamps
    end
  end
end

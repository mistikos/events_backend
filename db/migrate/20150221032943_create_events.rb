class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :slug, null: false, index: true
      t.datetime :start_at, null: false
      t.integer :duration, default: 12
      t.string :place, default: ''
      t.string :address, default: ''
      t.string :location
      t.float :latitude
      t.float :longitude
      t.text :description
      t.boolean :publish, default: false
      t.belongs_to :company, index: true, null: false
      t.belongs_to :creator, index: true, null: false
      t.belongs_to :event_type, index: true, null: false

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_at
      t.string :status, default: 'active' #active, past
      t.integer :duration
      t.string :place
      t.string :address, default: ''
      t.string :location
      t.float :latitude
      t.float :longitude
      t.text :description
      t.belongs_to :company, index: true
      t.belongs_to :creator, index: true

      t.timestamps
    end
  end
end
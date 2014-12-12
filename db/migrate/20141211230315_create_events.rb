class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_at
      t.string :state, default: 'active'
      t.integer :duration
      t.string :place
      t.float :latitude
      t.float :longitude
      t.belongs_to :creator, index: true

      t.timestamps
    end
  end
end

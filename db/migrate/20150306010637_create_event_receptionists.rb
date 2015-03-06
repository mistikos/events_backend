class CreateEventReceptionists < ActiveRecord::Migration
  def change
    create_table :event_receptionists do |t|
      t.belongs_to :event, index: true, null: false
      t.belongs_to :receptionist, index: true, null: false

      t.timestamps
    end
  end
end

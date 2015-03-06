class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.belongs_to :event, index: true, null: false
      t.belongs_to :company, index: true, null: false

      t.timestamps
    end
  end
end

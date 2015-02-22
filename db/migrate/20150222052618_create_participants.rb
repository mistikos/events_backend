class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.belongs_to :event, index: true
      t.belongs_to :company, index: true

      t.timestamps
    end
  end
end

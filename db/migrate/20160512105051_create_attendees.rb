class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end

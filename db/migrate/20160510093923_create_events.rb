class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null:false
      t.string :hold_at, null:false
      t.integer :capacity, null:false
      t.string :location, null:false
      t.string :owner, null:false
      t.string :description, null:false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

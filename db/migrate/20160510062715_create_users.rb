class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.integer :uid, null: false
      t.string :name
      t.string :nickname
      t.string :image
      t.string :description
      t.string :token
      t.string :secret

      t.timestamps null: false

      add_index :users, :provider
      add_index :users, :uid
      add_index :users, [:provider, :uid], unique: true
    end
  end
end

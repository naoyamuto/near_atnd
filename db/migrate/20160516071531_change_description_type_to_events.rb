class ChangeDescriptionTypeToEvents < ActiveRecord::Migration
  def change
    change_column :events, :description, :text, limit: 2000
  end
end

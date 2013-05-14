class ReplaceEboard < ActiveRecord::Migration
  def up
  	remove_column :users, :eboard
  	add_column :users, :eboard, :boolean, default: false
  end

  def down
  end
end

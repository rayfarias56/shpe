class AddPointsToEvents < ActiveRecord::Migration
  def up
    add_column :events, :value, :integer, default: 0
  end

  def down
    remove_column :events, :value
  end
end

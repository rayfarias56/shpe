class ChangeDecimalOnUsers < ActiveRecord::Migration
  def up
    change_column :users, :gpa, :decimal, :precision => 6, :scale => 2
  end

  def down
  end
end

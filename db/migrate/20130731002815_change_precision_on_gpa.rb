class ChangePrecisionOnGpa < ActiveRecord::Migration


  def change
    change_column :users, :gpa, :decimal, :precision => 6, :scale => 2
  end
end

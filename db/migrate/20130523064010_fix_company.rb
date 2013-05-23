class FixCompany < ActiveRecord::Migration
  def up

    remove_column :users, :company
    add_column :users, :company, :boolean, default: false
  end

  def down
  end
end

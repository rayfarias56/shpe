class AddAlumniToUsers < ActiveRecord::Migration
  def up
    add_column :users, :alumnus, :boolean, default: false
  end

  def down
    remove_column :users, :alumnus
  end
end

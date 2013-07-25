class RemoveAuthTokenToUsers < ActiveRecord::Migration
  def up
    remove_column :users, :auth_token
  end

  def down
  end
end

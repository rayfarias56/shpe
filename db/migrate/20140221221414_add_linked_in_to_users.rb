class AddLinkedInToUsers < ActiveRecord::Migration
  def up
    add_column :users, :linkedin_url, :string, default: nil
  end

  def down
    remove_column :users, :linkedin_url
  end
end

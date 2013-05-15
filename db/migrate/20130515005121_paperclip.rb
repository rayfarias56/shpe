class Paperclip < ActiveRecord::Migration
  def up
  	 add_attachment :users, :resume
  end

  def down
  	remove_attachment :users, :resume
  end
end

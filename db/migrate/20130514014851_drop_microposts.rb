class DropMicroposts < ActiveRecord::Migration


  def up
  	drop_table :microposts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

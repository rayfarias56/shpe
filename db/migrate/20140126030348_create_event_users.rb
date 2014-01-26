class CreateEventUsers < ActiveRecord::Migration
  def change
    create_table :event_users do |t|

      t.timestamps
    end
  end
end

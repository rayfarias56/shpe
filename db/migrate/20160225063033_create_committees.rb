class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string name:
      t.string email:
      t.text description:
      t.datetime meetingTime:
      t.string location:

      t.timestamps
    end
  end
end

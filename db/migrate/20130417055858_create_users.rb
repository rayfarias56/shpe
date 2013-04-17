class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :first_name
      t.string :last_name
      t.string :major
      t.date :graduation_date
      t.string :linkedin_link

      t.timestamps
    end
  end
end

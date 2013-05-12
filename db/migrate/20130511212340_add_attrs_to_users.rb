class AddAttrsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gpa, :decimal
    add_column :users, :major, :string
    add_column :users, :resume_link , :string
    add_column :users, :grad_date, :date
    add_column :users, :uin, :integer
    add_column :users, :eboard, :boolean
    add_column :users, :phone_number, :string
  end
end

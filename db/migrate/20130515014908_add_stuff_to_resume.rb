class AddStuffToResume < ActiveRecord::Migration
  def change
  	add_column :resumes, :user_id, :integer
  	add_attachment :resumes, :pdf
  end
end

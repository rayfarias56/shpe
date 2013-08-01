ActiveAdmin.register User do

  form do |f|
    f.inputs "Edit" do
      f.input :name
      f.input :email
      f.input :major
      f.input :gpa
      f.input :grad_date
      f.input :uin
      f.input :phone_number
      f.input :admin
      f.input :eboard
      f.input :company
    end
    f.actions
  end
end

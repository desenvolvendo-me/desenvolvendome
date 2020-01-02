ActiveAdmin.register Contact do
  menu priority: 3
  menu parent: "Gerenciamento"

  permit_params :response

  filter :response

  index do
    column :created_at do |user|
      user.created_at.strftime("%d/%m/%y %H:%M")
    end
    column :name
    column :email
    column :contact_type
    column :description
    column :response
    actions
  end

end

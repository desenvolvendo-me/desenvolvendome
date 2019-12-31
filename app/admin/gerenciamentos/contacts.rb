ActiveAdmin.register Contact do
  menu priority: 3
  menu parent: "Gerenciamento"

  config.filters = false

  index do
    column :name
    column :email
    column :contact_type
    column :description
    column :created_at do |user|
      user.created_at.strftime("%d/%m/%y %H:%M")
    end
  end

end

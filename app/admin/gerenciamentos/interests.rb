ActiveAdmin.register Interest do
  menu priority: 2
  menu parent: "Gerenciamento"

  index do
    column :email
    column :created_at do |user|
      user.created_at.strftime("%d/%m/%y %H:%M")
    end
  end
  
end

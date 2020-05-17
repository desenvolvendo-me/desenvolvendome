ActiveAdmin.register ApiControl do
  menu priority: 4
  menu parent: "Administração"

  index do
    selectable_column
    id_column
    column :key
    column :limit
    column :consume
    column :reset
    column :description
    actions
  end

  filter :key


end

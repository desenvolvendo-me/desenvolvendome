ActiveAdmin.register User do
  menu priority: 1
  menu parent: "Gerenciamento"

  index do
    column :level do |user|
      link_to user.level, user_path(user.login), target: "_blank"
    end
    column :login do |user|
      link_to user.login, "https://github.com/#{user.login}", target: "_blank"
    end
    column :email
    column :followers
    column :following
    column "Evaluations", :evaluations_count
    column "Repositories", :repositories_count
    column :created_at do |user|
      user.created_at.strftime("%d/%m/%y %H:%M")
    end
  end

end

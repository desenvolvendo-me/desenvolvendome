ActiveAdmin.register User do
  menu priority: 1

  index do
    column :evaluation_type do |user|
      link_to user.to_s, user_path(user.login), target: "_blank"
    end
    column :login do |user|
      link_to user.login, "https://github.com/#{user.login}", target: "_blank"
    end
    column :email
    column :followers
    column :following
    column "Evaluations", :evaluations_count
    column "Repositories", :repositories_count
  end

end

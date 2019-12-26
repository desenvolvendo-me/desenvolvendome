ActiveAdmin.register User do
  menu priority: 1

  index do
    column :evaluation_type do |user|
      user
    end
    column :login
    column :email
    column :followers
    column :following
    column "Evaluations", :evaluations_count
    column "Repositories", :repositories_count
  end

end

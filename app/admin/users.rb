ActiveAdmin.register User do
  menu priority: 1

  actions :index, :show

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
    actions
  end

  member_action :reimport, method: :get do
    GenerateProfileJob.perform_later(resource.login)

    redirect_to resource_path(resource), notice: "Reimportação iniciada para #{resource.login}"
  end

  action_item :view, only: :show do
    link_to 'Reimportar', reimport_admin_user_path(user)
  end


end

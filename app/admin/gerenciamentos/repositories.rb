ActiveAdmin.register Repository do
  menu priority: 1
  menu parent: "Gerenciamento"

  member_action :reevaluation, method: :get do
    EvaluationRepositoryJob.perform_later(resource.id)

    redirect_to admin_user_path(resource.user), notice: "Reavaliação iniciada para #{resource.name}"
  end

  action_item :view, only: :show do
    link_to 'Reimportar Repositórios', reimport_admin_user_path(user)
  end


end

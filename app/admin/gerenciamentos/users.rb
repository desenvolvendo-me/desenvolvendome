ActiveAdmin.register User do
  menu priority: 1
  menu parent: "Gerenciamento"

  actions :index, :show

  index do
    column :id
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

  show title: proc {|p| "Usuário: #{p.name ? p.name : p.login}"} do
    attributes_table do
      row :avatar do |user|
        image_tag user.avatar, size: "50x50"
      end
      row :name
      row :level do |user|
        link_to user.level, user_path(user.login), target: "_blank"
      end
      row :login do |user|
        link_to user.login, "https://github.com/#{user.login}", target: "_blank"
      end
      row :email
      row :bio
      row :followers
      row :following
      row :created_at do |user|
        user.created_at.strftime("%d/%m/%y %H:%M")
      end

      panel "Repositórios" do
        paginated_collection(user.repositories.page(params[:page]).per(15), download_links: false) do
          table_for(user.repositories, sortable: false) do
            column :name
            column :principal_technology
            column :stargazers_count
            column :commits_count
            column :forks_count
            column :technologies do |repository|
              language = ""
              repository.technologies.each do |tecnology|
                language.concat(tecnology.language.description, ", ")
              end
              language
            end
          end
        end
      end

    end
  end

  member_action :reimport, method: :get do
    GenerateProfileJob.perform_later(resource.login)

    redirect_to resource_path(resource), notice: "Reimportação iniciada para #{resource.login}"
  end

  action_item :view, only: :show do
    link_to 'Reimportar', reimport_admin_user_path(user)
  end


end

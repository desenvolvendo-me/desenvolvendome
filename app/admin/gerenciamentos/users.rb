ActiveAdmin.register User do
  menu priority: 1
  menu parent: "Gerenciamento"

  actions :index, :show

  filter :name
  filter :login

  index do
    column :id
    column :level do |user|
      link_to user.profile.level, profile_show_path(user.login), target: "_blank"
    end
    column :login do |user|
      link_to user.login, "https://github.com/#{user.login}", target: "_blank"
    end
    column :email
    column :followers
    column :following
    column :evaluations_count
    column :repositories_count
    column :created_at do |user|
      user.created_at.strftime("%d/%m/%y %H:%M")
    end
    column :evaluation_last do |user|
      user.evaluation_last.strftime("%d/%m/%y %H:%M")
    end
    actions
  end

  show title: proc {|p| "Usuário: #{p.name ? p.name : p.login}"} do
    attributes_table title: "Usuário" do
      row :avatar do |user|
        image_tag user.avatar, size: "50x50"
      end
      row :name
      row :level do |user|
        link_to user.level, profile_show_path(user.login), target: "_blank"
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
      row :evaluation_last do |user|
        user.evaluation_last.strftime("%d/%m/%y %H:%M")
      end

      panel "Repositórios" do
        repositories = user.repositories.where.not(commits_count: [nil, 0]).order(commits_count: :desc)
        paginated_collection(repositories.page(params[:page]).per(15), download_links: false) do
          table_for(repositories, sortable: false) do
            column :name do |repository|
              link_to repository.name, "https://github.com/#{repository.user.login}/#{repository.name}", target: "_blank"
            end
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

      panel "Evoluções" do
        versions = user.profile.evaluation.versions.order(id: :asc)

        paginated_collection(versions.page(params[:page]).per(15), download_links: false) do
          table_for(versions, sortable: false) do
            column "Versão" do |version|
              version.index
            end
            column "Perfil" do |version|
              if version.changeset.key? "evaluation_type"
                (version.changeset["evaluation_type"].first.nil? ? "Dev Null" : Evaluation.human_enum_name(:evaluation_types, version.changeset["evaluation_type"].first.to_s)) + " >> " + Evaluation.human_enum_name(:evaluation_types, version.changeset["evaluation_type"].last.to_s)
              end
            end
            column "Experiência" do |version|
              if version.changeset.key? "xp"
                (version.changeset["xp"].first.nil? ? "Dev Null" : version.changeset["xp"].first.to_s) + " >> " + version.changeset["xp"].last.to_s
              end
            end
            column "Nível" do |version|
              if version.changeset.key? "level"
                (version.changeset["level"].first.nil? ? "Dev Null" : version.changeset["level"].first.to_i.to_s) + " >> " + version.changeset["level"].last.to_s
              end
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

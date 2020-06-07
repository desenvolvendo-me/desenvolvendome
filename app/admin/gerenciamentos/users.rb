ActiveAdmin.register User do
  menu priority: 1
  menu parent: "Gerenciamento"
  permit_params :login, :email, :password
  actions :index, :show, :new, :create

  filter :name
  filter :login

  form do |f|
    f.inputs do
      f.input :login
      f.input :email
      f.input :password
      f.actions
    end
  end

  index do
    column :id
    column :level do |user|
      if user.profile
        link_to user.try(:profile).try(:level), profile_show_path(user.login), target: "_blank"
      else
        link_to "Em Importação", profile_show_path(user.login), target: "_blank"
      end
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
      user.try(:evaluation_last).try("strftime", "%d/%m/%y %H:%M")
    end
    column :reimport do |user|
      link_to 'Reimportar', reimport_admin_user_path(user)
    end
    column :reevaluation do |user|
      link_to 'Reavaliar', reevaluation_admin_user_path(user)
    end
    actions
  end

  show title: proc { |p| "Usuário: #{p.name ? p.name : p.login}" } do
    attributes_table title: "Usuário" do
      row :avatar do |user|
        image_tag user.avatar, size: "50x50" if user.avatar
      end
      row :name
      row :level do |user|
        user.profile ? link_to(user.try(:profile).try(:level), profile_show_path(user.login), target: "_blank") : "Sem Perfil"
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
        user.try(:evaluation_last).try("strftime", "%d/%m/%y %H:%M")
      end

      panel "Conhecimentos" do
        knowledges = user.try(:profile).try(:knowledges).try(:order,level: :desc)
        paginated_collection(knowledges.page(params[:page]).per(10), download_links: false) do
          table_for(collection, sortable: false) do
            column :language do |knowledge|
              knowledge.language.description
            end
            column :level
            column :experience
            column :rarity do |repository|
              Language.human_enum_name(:rarities, repository.language.rarity)
            end
            column :knowledge_type do |repository|
              Language.human_enum_name(:knowledge_types, repository.language.knowledge_type)
            end
            column "Ações" do
              link_to "Reavaliar Conhecimento"
            end
          end
        end if knowledges
      end

      panel "Repositórios" do
        repositories = user.repositories.order(commits_count: :desc)
        paginated_collection(repositories.page(params[:page]).per(15), download_links: false) do
          table_for(collection, sortable: false) do
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
            column "Ações" do |repository|
              link_to 'Reavaliar Repositório', reevaluation_admin_repository_path(repository)
            end
          end
        end
      end

      panel "Evoluções" do
        versions = user.try(:profile).try(:evaluation).try(:versions).reorder('id DESC')

        paginated_collection(versions.page(params[:page]).per(15), download_links: false) do
          table_for(collection, sortable: false) do
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
        end if versions
      end
    end
  end

  member_action :reimport, method: :get do
    Profile::Evolution.new(resource).reset_user if resource.profile

    LoadRepositoriesJob.perform_later(resource.login)

    redirect_to resource_path(resource), notice: "Reimportação iniciada para #{resource.login}"
  end

  member_action :reevaluation, method: :get do
    Profile::Evolution.new(resource).reset_evaluation if resource.profile

    EvaluationRepositoriesJob.perform_later(resource.login)

    redirect_to admin_user_path(resource), notice: "Reavaliação iniciada para #{resource.login}"
  end

  action_item :view, only: :show do
    link_to 'Reimportar', reimport_admin_user_path(user)
  end

  action_item :view, only: :show do
    link_to 'Reavaliar', reevaluation_admin_user_path(user)
  end


end

ActiveAdmin.register_page "Perfis" do
  menu parent: "Dashboards"

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Estatísticas dos Perfis".upcase
      end
    end
    columns do
      column do
        panel "Ocultos" do
          Profile.hidden.count
        end
      end
      column do
        panel "Github Vazio" do
          User.empty_github.count
        end
      end
    end
    columns do
      column do
        panel "Por Engajamento" do
          render partial: 'dashboards/profiles/engagement'
        end
      end
    end
    columns do
      column do
        panel "Por Tipo de Nível" do
          render partial: 'dashboards/profiles/evaluation_type'
        end
      end
      column do
        panel "Por Uso" do
          render partial: 'dashboards/profiles/evaluation_count'
        end
      end
    end
    columns do
      column do
        panel "Com Acessos entre 25 e 100" do
          render partial: 'dashboards/profiles/per_page_profile_greater_than', locals: {number_accesses_min: 25, number_accesses_max: 100}
        end
      end
      column do
        panel "Com Acessos entre 101 e 250" do
          render partial: 'dashboards/profiles/per_page_profile_greater_than', locals: {number_accesses_min: 101, number_accesses_max: 250}
        end
      end
      column do
        panel "Com Acessos entre 251 e 1000" do
          render partial: 'dashboards/profiles/per_page_profile_greater_than', locals: {number_accesses_min: 251, number_accesses_max: 1000}
        end
      end
    end
  end
end
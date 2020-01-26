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
        panel "Por Visitas por Login" do
          render partial: 'dashboards/profiles/login_visit'
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
        panel "Com Acessos entre 10 e 25" do
          render partial: 'dashboards/visits/per_page_profile_greater_than', locals: {number_accesses_min: 10, number_accesses_max: 25}
        end
      end
      column do
        panel "Com Acessos entre 25 e 50" do
          render partial: 'dashboards/visits/per_page_profile_greater_than', locals: {number_accesses_min: 25, number_accesses_max: 50}
        end
      end
      column do
        panel "Com Acessos entre 50 e 100" do
          render partial: 'dashboards/visits/per_page_profile_greater_than', locals: {number_accesses_min: 50, number_accesses_max: 100}
        end
      end
    end
  end
end
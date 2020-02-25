ActiveAdmin.register_page "Visitas" do
  menu parent: "Dashboards"

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Estatísticas das Visitas".upcase
      end
    end
    columns do
      column do
        panel "Por Dia (Mês Atual x Anterior)" do
          render partial: 'dashboards/visits/per_day'
        end
      end
    end
    columns do
      column do
        panel "Por Usuário" do
          render partial: 'dashboards/visits/per_user'
        end
      end
    end
  end
end
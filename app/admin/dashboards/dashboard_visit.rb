ActiveAdmin.register_page "Visitas" do
  menu parent: "Dashboards"

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Páginas".upcase
      end
    end
    columns do
      column do
        panel "Por Todas" do
          render partial: 'dashboards/visits/per_page'
        end
      end
    end
    columns do
      column do
        panel "Por Venda" do
          render partial: 'dashboards/visits/per_page_sales'
        end
      end
    end
    columns do
      column do
        panel "Por Profiles com Visitas > 50" do
          render partial: 'dashboards/visits/per_page_profile_50'
        end
      end
    end
  end
end
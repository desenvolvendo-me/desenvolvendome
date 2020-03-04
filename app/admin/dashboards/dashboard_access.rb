ActiveAdmin.register_page "Acessos" do
  menu parent: "Dashboards"

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Estatísticas das Páginas".upcase
      end
    end
    columns do
      column do
        panel "Por Dia (Mês Atual x Anterior)" do
          render partial: 'dashboards/events/per_day'
        end
      end
    end
    columns do
      column do
        panel "Por Todas" do
          render partial: 'dashboards/events/per_page'
        end
      end
      column do
        panel "Por Venda" do
          render partial: 'dashboards/events/per_page_sales'
        end
      end
    end
  end
end
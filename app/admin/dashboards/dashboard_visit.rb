ActiveAdmin.register_page "Visitas" do
  menu parent: "Dashboards"

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Estatísticas das Páginas".upcase
      end
    end
    columns do
      column do
        panel "Total de Visitantes" do
          Ahoy::Visit.count
        end
      end
      column do
        panel "Total de Acessos" do
          Ahoy::Event.count
        end
      end
    end
    columns do
      column do
        panel "Visitantes por Dia" do
          render partial: 'dashboards/visits/per_day'
        end
      end
      column do
        panel "Visitantes por Mês" do
         render partial: 'dashboards/visits/per_month'
        end
      end
    end
    columns do
      column do
        panel "Acessos por Dia" do
         render partial: 'dashboards/events/per_day'
        end
      end
      column do
        panel "Acessos por Mês" do
         render partial: 'dashboards/events/per_month'
        end
      end
    end
    columns do
      column do
        panel "Por Todas" do
          render partial: 'dashboards/visits/per_page'
        end
      end
      column do
        panel "Por Venda" do
          render partial: 'dashboards/visits/per_page_sales'
        end
      end
    end
    columns do
      column do
        panel "Por Profiles com Acessos > 25" do
          render partial: 'dashboards/visits/per_page_profile_greater_than'
        end
      end
    end
  end
end
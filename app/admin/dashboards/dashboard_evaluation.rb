ActiveAdmin.register_page "Usuários" do
  menu parent: "Dashboards"

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Estatísticas dos Usuários".upcase
      end
    end
    columns do
      column do
        panel "Por Tipo de Nível" do
          render partial: 'dashboards/profiles/evaluation_type'
        end
      end
    end
    columns do
      column do
        panel "Por Quantidade de Avaliações" do
          render partial: 'dashboards/profiles/evaluation_count'
        end
      end
    end

  end
end
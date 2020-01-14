ActiveAdmin.register_page "Linguagens" do
  menu parent: "Dashboards"

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Estatísticas das Linguagens".upcase
      end
    end
    columns do
      column do
        panel "Por Uso" do
          render partial: 'dashboards/languages/knowledge'
        end
      end
    end
  end
end
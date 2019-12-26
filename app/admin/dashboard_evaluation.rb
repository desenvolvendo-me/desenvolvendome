ActiveAdmin.register_page "Dashboard Avaliação" do


  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Dashboard Avaliação"
      end
    end
    columns do
      column do
        panel "Por Avaliação" do
          render partial: 'dashboards/profiles/evaluation_type'
        end
      end
    end

  end
end
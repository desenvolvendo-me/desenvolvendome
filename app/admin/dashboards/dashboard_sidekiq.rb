ActiveAdmin.register_page "Sidekiq" do
  menu parent: "Dashboards"

  content title: proc {I18n.t("active_admin.dashboard")} do
    columns do
      column do
        ActiveAdminSidekiqStats::Panel.inject
      end
    end
    columns do
      column do
        panel "Sidekiq Admin" do
          link_to "Mais Informações", sidekiq_web_path
        end
      end
    end
  end
end
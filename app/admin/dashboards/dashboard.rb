ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc {I18n.t("active_admin.dashboard")}

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Cadastros".upcase
      end
    end
    columns do
      column do
        panel "Total de Usuários" do
          User.count
        end
      end
      column do
        panel "Total de Interesses" do
          Interest.count
        end
      end
      column do
        panel "Total de Contatos" do
          Contact.count
        end
      end
    end
    columns do
      column do
        panel "Usuários por Dia" do
          render partial: 'dashboards/users/per_day'
        end
      end
      column do
        panel "Usuários por Mês" do
          render partial: 'dashboards/users/per_month'
        end
      end
    end
    columns do
      column do
        panel "Interesses por Dia" do
          render partial: 'dashboards/interests/per_day'
        end
      end
      column do
        panel "Interesses por Mês" do
          render partial: 'dashboards/interests/per_month'
        end
      end
    end
    columns do
      column do
        panel "Contatos por Dia" do
          render partial: 'dashboards/contacts/per_day'
        end
      end
      column do
        panel "Contatos por Mês" do
          render partial: 'dashboards/contacts/per_month'
        end
      end
    end
  end
end

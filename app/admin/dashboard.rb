ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc {I18n.t("active_admin.dashboard")}

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Estatísticas Geral".upcase
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
      column do
        panel "Total de Comparações" do
          Compare.count
        end
      end
    end
    columns do
      column span: 2 do
        panel "Usuários por Dia (Mês Anterior e Atual)" do
          render partial: 'dashboards/users/per_day'
        end
      end
      column do
        panel "Usuários por Mês (3 meses)" do
          render partial: 'dashboards/users/per_month'
        end
      end
    end
    columns do
      column span: 2 do
        panel "Interesses por Dia (Mês Anterior e Atual)" do
          render partial: 'dashboards/interests/per_day'
        end
      end
      column do
        panel "Interesses por Mês (3 meses)" do
          render partial: 'dashboards/interests/per_month'
        end
      end
    end
    columns do
      column span: 2 do
        panel "Contatos por Dia (Mês Anterior e Atual)" do
          render partial: 'dashboards/contacts/per_day'
        end
      end
      column do
        panel "Contatos por Mês (3 meses)" do
          render partial: 'dashboards/contacts/per_month'
        end
      end
    end
  end
end

ActiveAdmin.register_page "Linguagens" do
  menu parent: "Dashboards"

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Linguagens".upcase
      end
    end
    columns do
      column do
        panel "Por Uso (Linguagens ABCDE)" do
          render partial: 'dashboards/languages/knowledge', locals: {starters: ["a", "b", "c", "d", "e"]}
        end
      end
    end

    columns do
      column do
        panel "Por Uso (Linguagens FGHIJ)" do
          render partial: 'dashboards/languages/knowledge', locals: {starters: ["f", "g", "h", "i", "j"]}
        end
      end
    end

    columns do
      column do
        panel "Por Uso (Linguagens LMNOP)" do
          render partial: 'dashboards/languages/knowledge', locals: {starters: ["l", "m", "n", "o", "p"]}
        end
      end
    end

    columns do
      column do
        panel "Por Uso (Linguagens QRSTU)" do
          render partial: 'dashboards/languages/knowledge', locals: {starters: ["q", "r", "s", "t", "u"]}
        end
      end
    end
    columns do
      column do
        panel "Por Uso (Linguagens VXWYZ)" do
          render partial: 'dashboards/languages/knowledge', locals: {starters: ["v", "x", "x", "w", "y", "z"]}
        end
      end
    end
  end
end
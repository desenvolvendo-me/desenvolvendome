ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recentes Usuários" do
          ul do
            User.last(10).map do |user|
              li link_to(user.to_s, user_path(user.login), target: "_blank")
            end
          end
        end
      end
      column do
        panel "Recentes Interesses" do
          ul do
            Interest.last(10).map do |interest|
              li link_to(interest.email, admin_interest_path(interest), target: "_blank")
            end
          end
        end
      end
      column do
        panel "Recentes Contatos" do
          ul do
            Contact.last(10).map do |contact|
              li link_to(contact.name, admin_contact_path(contact), target: "_blank")
            end
          end
        end
      end
    end
  end
end

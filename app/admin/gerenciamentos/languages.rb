ActiveAdmin.register Language do
  menu priority: 1
  menu parent: "Gerenciamento"

  actions :index, :show, :edit

  filter :description
  filter :knowledge_type, as: :select, :collection => Language.knowledge_types.map {|k, v| [Language.human_enum_name(:knowledge_types, k), v]}
  filter :rarity, as: :select, :collection => Language.rarities.map {|k, v| [Language.human_enum_name(:rarities, k), v]}

  index do
    column :id
    column :description
    column :knowledge_type do |language|
      Language.human_enum_name(:knowledge_types, language.knowledge_type)
    end
    column :rarity do |language|
      Language.human_enum_name(:rarities, language.rarity)
    end
    actions
  end

  show title: proc {|p| "Linguagem: #{p.description}"} do
    attributes_table title: "Linguagem" do
      row :id
      row :description
      row :knowledge_type do |language|
        Language.human_enum_name(:knowledge_types, language.knowledge_type)
      end
      row :rarity do |language|
        Language.human_enum_name(:rarities, language.rarity)
      end
      row :created_at do |user|
        user.created_at.strftime("%d/%m/%y %H:%M")
      end

    end
  end

end

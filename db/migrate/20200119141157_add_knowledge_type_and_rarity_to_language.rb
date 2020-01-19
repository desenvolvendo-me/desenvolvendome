class AddKnowledgeTypeAndRarityToLanguage < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :knowledge_type, :integer
    add_column :languages, :rarity, :integer
  end
end

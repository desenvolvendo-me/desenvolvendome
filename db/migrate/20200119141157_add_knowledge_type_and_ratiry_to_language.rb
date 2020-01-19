class AddKnowledgeTypeToLanguage < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :knowledge_type, :integer
    add_column :languages, :ratiry, :integer
  end
end

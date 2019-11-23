class AddLanguageTypeLevelToKnowledges < ActiveRecord::Migration[6.0]
  def change
    add_column :knowledges, :knowledge_type, :integer
    add_column :knowledges, :level, :integer
  end
end

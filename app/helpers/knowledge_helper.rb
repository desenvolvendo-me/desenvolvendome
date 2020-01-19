module KnowledgeHelper

  def people_same_knowledge(language)
    profile_count = Profile.count
    profile_count_with_knowledge = Profile.joins(:knowledges).where("knowledges.language_id": language.id).count
    percentage = ((profile_count_with_knowledge.to_f / profile_count.to_f) * 100).round(2)

    "<strong class='#{percentage < 20 ? "text-success" : "text-danger"}'>#{percentage}%</strong> dos perfis conhecem".html_safe
  end

  def people_higher_level(knowledge)
    profile_count = Profile.joins(knowledges: :language).where("languages.id": knowledge.language.id).count
    profile_count_with_knowledge_and_level = Profile.joins(:knowledges).where("knowledges.language_id": knowledge.language.id).where("knowledges.level > ?", knowledge.level).count
    percentage = ((profile_count_with_knowledge_and_level.to_f / profile_count.to_f) * 100).round(2)

    "<strong class='#{percentage < 20 ? "text-success" : "text-danger"}'>#{percentage}%</strong> dos perfis tem o nível maior".html_safe
  end

end
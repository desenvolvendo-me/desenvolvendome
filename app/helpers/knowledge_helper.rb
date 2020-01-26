module KnowledgeHelper

  def people_same_knowledge(language)
    profile_count = Profile.count
    profile_count_with_knowledge = Profile.joins(:knowledges).where("knowledges.language_id": language.id).count
    percentage = ((profile_count_with_knowledge.to_f / profile_count.to_f) * 100).round(2)

    percente_class(percentage, "dos perfis conhecem")
  end

  def people_higher_level(knowledge)
    profile_count = Profile.joins(knowledges: :language).where("languages.id": knowledge.language.id).count
    profile_count_with_knowledge_and_level = Profile.joins(:knowledges).where("knowledges.language_id": knowledge.language.id).where("knowledges.level > ?", knowledge.level).count
    percentage = ((profile_count_with_knowledge_and_level.to_f / profile_count.to_f) * 100).round(2)

    percente_class(percentage, "dos perfis tem o nível maior")
  end

  private
  
  def percente_class(percentage, text)
    if percentage < 20
      text_class = "text-success"
    elsif percentage > 20 and percentage < 50
      text_class = "text-info"
    elsif percentage > 50 and percentage < 70
      text_class = "text-warning"
    else
      text_class = "text-danger"
    end
    "<strong class='#{text_class}'>#{percentage}%</strong> #{text}".html_safe
  end

end
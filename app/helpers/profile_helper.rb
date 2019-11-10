module ProfileHelper

  def result_evaluations(profile)
    profile.evaluations.pluck(:level, :evaluation_type).map {|level, evaluation_type| {level: level, evaluation_type: t("enum.evaluation_type.#{evaluation_type}")}}
  end

  def result_knowledges(profile)
    profile.knowledges.joins(:language).where("experience >= 1").pluck(:experience, :"languages.description").first(5).map {|experience, language| {name: language, value: experience.round(2)}}
  end

  def progress_bar(user)
    processing = user.profile.processing.to_f / user.repositories_count.to_f
    return 100 if processing == 1
    (1 - processing) * 100
  end

end
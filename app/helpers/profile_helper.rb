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

  def next_level_bar(user)
    level = {}
    if user.profile.evaluation.started?
      level = Evolution::Started.new(user).next_level
    elsif user.profile.evaluation.novice?
      level = Evolution::Novice.new(user).next_level
    elsif user.profile.evaluation.knight?
      level = Evolution::Knight.new(user).next_level
    end
    level
  end

end
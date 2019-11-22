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
    level = {number: 0, percentage: 0}
    if user.profile.evaluation.started?
      started = Evaluation::Started.new(user)
      level[:number] = started.max ? "MÁXIMO NÍVEL" : "+#{started.xp_next_level}"
      level[:percentage] = started.max ? 100 : (1 - (started.xp_next_level.to_f / started.role[:calc].to_f)) * 100
    elsif user.profile.evaluation.novice?
      20
    elsif user.profile.evaluation.knight?
      30
    end
    level
  end

end
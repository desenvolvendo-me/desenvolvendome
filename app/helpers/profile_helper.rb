module ProfileHelper

  def result_evaluations(profile)
    profile.evaluations.pluck(:level, :evaluation_type).map {|level, evaluation_type| {level: level, evaluation_type: t("enum.evaluation_type.#{evaluation_type}")}}
  end

  def progress_bar(user)
    processing = user.profile.processing.to_f / user.repositories_count.to_f
    return 100 if processing == 1
    (1 - processing) * 100
  end

end
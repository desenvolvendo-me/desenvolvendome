module ProfileHelper

  def result_evaluations(profile)
    profile.evaluations.pluck(:level, :evaluation_type).map {|level, evaluation_type| {level: level, evaluation_type: t("enum.evaluation_type.#{evaluation_type}")}}
  end

end
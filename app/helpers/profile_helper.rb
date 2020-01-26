module ProfileHelper

  def progress_bar(user)
    processing = (user.profile.processing.to_f / user.repositories_count.to_f)
    return 100 if (processing == 1 or user.repositories_count.to_f == 0)
    (1 - processing) * 100
  end

  def next_level_bar(user)
    level = {}
    if user.profile.evaluation.started?
      level = Profile::Evolution::Started.new(user).next_level
    elsif user.profile.evaluation.novice?
      level = Profile::Evolution::Novice.new(user).next_level
    elsif user.profile.evaluation.knight?
      level = Profile::Evolution::Knight.new(user).next_level
    end
    level
  end

end
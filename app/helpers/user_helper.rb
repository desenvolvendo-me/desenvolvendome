module UserHelper

  def knowledge_greater_than_1(user)
    user.profile.knowledges.where("experience >= 1")
  end

  def knowledge_less_than_1(user)
    user.profile.knowledges.where("experience < 1")
  end

  def number_small_projects(user)
    user.repositories.where("commits_count < 50").count
  end

  def number_medium_projects(user)
    user.repositories.where("commits_count > 50 and commits_count < 100").count
  end

  def number_large_projects(user)
    user.repositories.where("commits_count > 100").count
  end
end
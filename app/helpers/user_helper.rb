module UserHelper

  def knowledge_greater_than_1(user)
    user.profile.knowledges.where("experience >= 1")
  end

  def knowledge_less_than_1(user)
    user.profile.knowledges.where("experience < 1")
  end

end
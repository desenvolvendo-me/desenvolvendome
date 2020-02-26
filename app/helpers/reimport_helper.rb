module ReimportHelper

  def waiting_time
    ((current_user.minimum_evaluation_period.to_datetime - DateTime.now)* 24).to_f.ceil
  end

end
module ApplicationHelper

  def count_user_analysis
    "#{(User.count + 5254)} já se analisaram"
  end

  def label_experience(number)
    case number
    when 0..20
      "danger"
    when 20..50
      "warning"
    when 50..70
      "info"
    when 70..90
      "success"
    else
      "default" #black
    end
  end

  def label_level(number)
    case number
    when 0
      "danger"
    when 1
      "warning"
    when 2..3
      "info"
    when 4
      "success"
    else
      "default" #black
    end
  end
end

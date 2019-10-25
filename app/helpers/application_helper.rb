module ApplicationHelper

  def define_label(percentage)
    case percentage
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
end

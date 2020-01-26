module EnumI18nHelper

  def enum_options_for_select(class_name, enum)
    class_name.send(enum.to_s.pluralize).map do |key, _|
      [class_name.human_enum_name(enum, key), key]
    end
  end

end
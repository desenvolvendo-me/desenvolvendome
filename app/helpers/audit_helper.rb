module AuditHelper

  def get_audited_changes(audit, attribute)

    if audit.audited_changes[attribute].kind_of?(Array)
      attribute_value = audit.audited_changes[attribute].to_a.last.to_i
    else
      attribute_value = audit.audited_changes[attribute].to_i
    end

    if ["evaluation_type"].include? attribute
      attribute_value = enum_i18n(audit.auditable.class.name.constantize, attribute, audit.auditable.class.name.constantize.send(attribute.pluralize).keys[attribute_value])
    else
      attribute_value = attribute_value.eql?(0) ? attribute_value.to_s : audit.auditable.send(attribute).to_s
    end

    attribute_value
  end

end
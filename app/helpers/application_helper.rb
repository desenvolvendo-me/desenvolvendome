module ApplicationHelper

  def check_js(controller, action)
    File.exist? Rails.root.to_s + "/app/javascript/packs/#{controller}/#{action}.js"
  end

  def asset_exists?(path)
    if Rails.configuration.assets.compile
      Rails.application.precompiled_assets.include? path
    else
      Rails.application.assets_manifest.assets[path].present?
    end
  end

  def knowledge_type(language_description)
    knowledge_type = "empty"
    return knowledge_type unless language_description

    knowledge = Knowledge.joins(:language).where("languages.description = ?", language_description).take
    return knowledge_type unless knowledge

    knowledge_type = knowledge.knowledge_type
    knowledge_type
  end
end

module ApplicationHelper

  def check_js(controller, action)
    File.exist? Rails.root.to_s + "/app/javascript/packs/#{controller}/#{action}.js"
  end

  def asset_exists?(path)
    begin
      pathname = Rails.application.assets.resolve(path)
      return !!pathname # double-bang turns String into boolean
    rescue Sprockets::FileNotFound
      return false
    end
  end
end

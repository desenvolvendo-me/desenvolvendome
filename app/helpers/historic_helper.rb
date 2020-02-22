module HistoricHelper

  def get_version(version)
    return "v0.0.0" if version.event.eql? "create"

    current_version = "v"
    current_version += (Evaluation.evaluation_types[(version.changeset["evaluation_type"] ? version.changeset["evaluation_type"].last : version.reify.evaluation_type)] + 1).to_s + "."
    current_version += (version.changeset["level"] ? version.changeset["level"].last : version.reify.level).to_s + "."
    current_version += (version.changeset["xp"] ? version.changeset["xp"].last : version.reify.xp).to_s
    current_version
  end

end
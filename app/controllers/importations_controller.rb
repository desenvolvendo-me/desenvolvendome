class ImportationsController < ApplicationController

  def repository
    if !current_user.can_evaluation?
      GenerateProfileJob.perform_later(current_user.login)
      redirect_to repositories_user_path(current_user.login), notice: 'Reimportação Envia com Sucesso'
    else
      redirect_to reimport_rule_path
    end
  end

  def repositories
    if current_user.can_evaluation?
      GenerateProfileJob.perform_later(current_user.login)
      redirect_to repositories_user_path(current_user.login), notice: 'Reimportação Envia com Sucesso'
    else
      redirect_to reimport_rule_path
    end
  end

end

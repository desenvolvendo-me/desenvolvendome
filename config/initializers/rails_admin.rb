RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  ##FIXME: Erro no token em production
  # config.authenticate_with do
  #   warden.authenticate! scope: :admin
  # end
  # config.current_user_method(&:current_admin)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    all_limit = [User, Profile, Evaluation, Knowledge, Repository, Language, Technology]

    dashboard

    index

    new do
      except all_limit + [Interest]
    end

    show do
      except all_limit
    end

    edit do
      except all_limit + [Interest]
    end

    delete do
      except all_limit
    end

    export

    bulk_delete do
      except all_limit
    end

    #show_in_app
    #history_index
    #history_show
  end

  config.model 'Interest' do
    weight -2
  end

  config.model 'Profile' do
    weight -1
  end

  config.model 'User' do
    parent 'Profile'
  end

  config.model 'Repository' do
    parent 'User'
  end

  config.model 'Language' do
    parent 'Repository'
  end

  config.model 'Knowledge' do
    parent 'Profile'
  end

  config.model 'Evaluation' do
    parent 'Profile'
  end

  config.model 'Technology' do
    parent 'Repository'
  end


end

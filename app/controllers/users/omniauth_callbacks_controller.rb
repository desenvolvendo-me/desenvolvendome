class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?

      sign_in @user
      ahoy.authenticate(@user)

      unless @user.profile
        GenerateProfileJob.perform_later(@user.login)
      end

      redirect_to profile_show_path(@user.login)
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
end
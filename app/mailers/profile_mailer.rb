class ProfileMailer < ApplicationMailer

  def evaluation_completed
    @user = params[:user]
    @url = profile_show_path(@user.login)
    mail(to: @user.email, subject: 'DesenvolvendoMe: Avaliação')
  end

end

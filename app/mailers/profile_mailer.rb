class ProfileMailer < ApplicationMailer

  def evaluation_completed
    @user = params[:user]
    @url = user_path(@user.login)
    mail(to: @user.email, subject: 'DesenvolvendoMe: Avaliação')
  end

end

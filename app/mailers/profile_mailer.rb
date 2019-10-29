class ProfileMailer < ApplicationMailer

  def created
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'DesenvolvendoMe: Avaliação')
  end

end

class ProfileMailer < ApplicationMailer

  def created
    @user = params[:user]
    @url = user_path(@user)
    mail(to: @user.email, subject: 'DesenvolvendoMe: Avaliação')
  end

end

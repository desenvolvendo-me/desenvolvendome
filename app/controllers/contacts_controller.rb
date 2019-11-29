class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    #TODO: Adicionar email agradeçendo o contato
    respond_to do |format|
      if @contact.save
        format.html {redirect_to root_path, notice: 'Contato enviado com sucesso.'}
      else
        format.html {render :new}
      end
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :contact_type, :description)
  end
end

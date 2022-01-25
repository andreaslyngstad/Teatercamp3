class ContactsController < ApplicationController
  def index
    @contacts = Registration.order("camp_id").includes(:camp)

  end

  def destroy
    @contact = Registration.find(params[:id])
    @contact.destroy

    respond_to do |format|
      flash[:notice] = 'Kontakten er slettet'
      format.html { redirect_to(contacts_url) }
      format.xml  { head :ok }
    end
  end

end

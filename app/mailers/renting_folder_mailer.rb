class RentingFolderMailer < ApplicationMailer

  def renting_folder_notification_renter
    @renter = params[:renter]
    @tenant = params[:tenant]
    @flat = params[:flat]
    mail( :to => @renter.email,
      :subject => "Tu as un dossier déposé !" )
  end

  def renting_folder_notification_tenant
    @renting_folder = params[:renting_folder]
    @renter = params[:renter]
    @tenant = params[:tenant]
    @flat = params[:flat]
    mail( :to => @tenant.email,
      :subject => "Tu as une réponse à ta demande de location" )
  end

  def automatic_renting_folder_denied
    @renting_folder = params[:renting_folder]
    @renter = params[:renter]
    @tenant = params[:tenant]
    @flat = params[:flat]
    mail( :to => @tenant.email,
      :subject => "Malheureusement, l'appartement pour lequel tu as fait déposé un dossier vient d'être loué..." )
  end
end

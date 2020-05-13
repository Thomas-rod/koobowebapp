class RentingFolderMailer < ApplicationMailer

  def reting_folder_notification_renter
    @renter = params[:renter]
    @tenant = params[:tenant]
    @flat = params[:flat]
    mail( :to => @renter.email,
      :subject => "Tu as un dossier déposé !" )
  end
end

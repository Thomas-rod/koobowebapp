class VisitMailer < ApplicationMailer

  def visit_notification_renter
    @renter = params[:renter]
    @tenant = params[:tenant]
    mail( :to => @renter.email,
      :subject => "Tu as une demande de visite !" )
  end
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_answer_visit_mail
    @tenant = params[:tenant]
    @visit = params[:visit]
    mail( :to => @tenant.email,
    :subject => "On a répondu à ta demande de visite !" )
  end

  def after_visit_mail
    @tenant = params[:tenant]
    @renter = params[:renter]
    @visit = params[:visit]
    mail( :to => tenant.email,
      :subject => "Alors ? Qu'as tu pensé de ta visite ?")
  end
end

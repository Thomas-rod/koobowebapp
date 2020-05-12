class VisitAnswerTenant < ApplicationMailer

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_answer_visit_mail(user, visit)
    @user = user
    mail( :to => @user.email,
    :subject => "On a répondu à ta demande de visite ! Viens vite voir sur Koobo" )
  end
end

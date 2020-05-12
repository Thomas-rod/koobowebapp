class VisitMailer < ApplicationMailer

  def new_visit(visit)
    @user = visit.schedule.flat.user
    @url = "https://www.koobo.co/users/sign_in"
    mail(to: @user.email, subject: 'Tu viens de reçevoir une demande de visite ! Koobo')
  end
end

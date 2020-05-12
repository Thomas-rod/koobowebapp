class UserMailer < ApplicationMailer

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => "Bienvenu chez toi ! Merci d'avoir rejoins Koobo !" )
  end
end

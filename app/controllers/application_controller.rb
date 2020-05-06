class ApplicationController < ActionController::Base
  # app/controllers/application_controller.rb

  # def default_url_options
  #   { host: ENV["DOMAIN"] || "localhost:3000" }
  # end
  protect_from_forgery

  before_action :authenticate_user!

  include Pundit

  def update_user_renter
    user = User.find(params[:id])
    if user.renter == true
      user.update!(renter: false)
      redirect_to dashboard_path, notice: "Vous voilà locataire ! Super"
    elsif user.renter == false
      user.update!(renter: true)
      redirect_to dashboard_path, notice: "Vous voilà propriétaire ! Félicitations"
    end
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  #-----------------------------------#
            protected
  #------------------------------------#

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_up_path_for(resource)
    dashboard_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  #-----------------------------------#
            private
  #------------------------------------#

  def user_not_authorized
    flash[:warning] = "Tu n'es pas authorisé à voir cette page. Mauvais !"
    redirect_to(request.referrer || dashboard_path)
  end


end

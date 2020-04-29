class ApplicationController < ActionController::Base
  # app/controllers/application_controller.rb

  # def default_url_options
  #   { host: ENV["DOMAIN"] || "localhost:3000" }
  # end

  before_action :authenticate_user!

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

  protected

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_up_path_for(resource)
    dashboard_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end


end

class ApplicationController < ActionController::Base
  # app/controllers/application_controller.rb

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  before_action :authenticate_user!


  protected

  def after_sign_in_path_for(resource)
    flats_path
  end

  def after_sign_up_path_for(resource)
    flats_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end

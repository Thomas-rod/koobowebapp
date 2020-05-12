# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

require "will_paginate"

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['USERNAME_SENDGRID'],
  :password => ENV['PASSWORD_SENDGRID'],
  :domain => ENV['DOMAIN'],
  :address => 'smtp.sendgrid.net',
  :port => 465,
  :authentication => :plain,
  :enable_starttls_auto => true
}

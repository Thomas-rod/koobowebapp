class ApplicationMailer < ActionMailer::Base
  default from: 'thomas@koobo.co', reply_to: 'thomas@koobo.co'
  layout 'mailer'
end

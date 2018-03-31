class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_LOGIN']
  layout 'mailer'
end

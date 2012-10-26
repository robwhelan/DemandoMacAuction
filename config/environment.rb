# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
DemandoAuction::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'app8701821@heroku.com',
  :password       => 'iye5qabm',
  :domain         => 'www.deman.do',
  :enable_starttls_auto => true
}

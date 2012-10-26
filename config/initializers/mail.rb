ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'app8701821@heroku.com',
  :password       => 'iye5qabm',
  :domain         => 'www.deman.do',
  :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp
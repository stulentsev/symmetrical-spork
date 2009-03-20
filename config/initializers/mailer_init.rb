ActionMailer::Base.smtp_settings = {
  :address => 'smtp.yandex.ru',
  :port => 25,
  :domain => 'yandex.ru',
  :user_name => 'mailer-test-1',
  :password => '5QGfY6PvwU9d',
  :authentication => :login
}
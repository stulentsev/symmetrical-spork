class UserMailer < ActionMailer::Base

  def new_password_notification(project_team_member)
    recipients project_team_member.email
    subject 'Welcome to Oi Kabum'
    from 'mailer-test-1@yandex.ru'
    content_type 'text/html'
    body :recipient => project_team_member.name,
         :login => project_team_member.email,
         :password => project_team_member.user.password

  end

  default_url_options[:host] = "localhost:3000"

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "Oi Kabum Notifier <mailer-test-1@yandex.ru>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

end

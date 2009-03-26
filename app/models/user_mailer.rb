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

end

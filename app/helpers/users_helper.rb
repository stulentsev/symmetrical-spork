module UsersHelper

  def find_or_create_user_by_login(login, user_type)
    user = User.find_by_login login
      unless user
        user = User.new(:login => login,
                        :user_type_id => user_type # Educadores
                       )
        user.assign_random_password
        user.save_without_session_maintenance
      end
      return user
  end

end

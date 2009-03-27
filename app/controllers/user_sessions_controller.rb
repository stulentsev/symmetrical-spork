class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new

    render :layout => 'login'
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default dashboard_course_url(1)
    else
      render :action => :new, :layout => "login"
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end

  private

  def get_redirect_url_for_user(login)
    user = User.find_by_login(login)
    if user
      case user.user_type.name
      when 'Coordenador'
        return edit_course_url(1) # TODO: remove hardcoded course id
      else
        return account_url
      end
    end
    return account_url
  end

end

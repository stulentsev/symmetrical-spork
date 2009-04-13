# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '536bea9ff7442be747626b270c908b25'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user


  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def require_user_role(roles = [])
      roles = [roles] if !roles.is_a?(Array)
      user_type_ids = {:coordinator => 1,
                       :educator_specific => 2,
                       :educator_transversal => 3,
                       :student => 4,
                       :gestor => 5
                      }.select {|k, v| roles.member?(k)}.map{|k, v| v}
      throw Exception.new("Authorization error!") if !current_user.gestor? &&
              !user_type_ids.member?(current_user.user_type_id)
    end

end

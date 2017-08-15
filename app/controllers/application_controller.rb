class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action { |c| Authorization.current_user = c.current_user }

  def permission_denied
    redirect_to root_path
  end
end

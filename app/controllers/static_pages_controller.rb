class StaticPagesController < ApplicationController
  # Since we aren't logged in when hitting this controller then we need to skip
  # some before actions.
  skip_before_action :authenticate_user!

  def home
    # For the registration form.
    @new_user = User.new
    # For the login form.
    @login_user = User.new
  end
end

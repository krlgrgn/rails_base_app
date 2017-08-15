class UsersController < ApplicationController
  # Since we aren't logged in when hitting this controller then we need to skip
  # some before actions.
  skip_before_action :authenticate_user!, only: :create

  def create
    @new_user = User.new(user_params)

    if @new_user.save
      sign_in @new_user
      flash[:success] = 'user created'
      redirect_to root_path
    else
      # For the login form.
      @login_user = User.new
      render 'static_pages/home'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,
      :password,
      :first_name,
      :last_name,
      :location,
      :date_of_birth)
  end
end

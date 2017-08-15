class SessionsController < ApplicationController
  # Since we aren't logged in when hitting this controller then we need to skip
  # some before actions.
  skip_before_action :authenticate_user!, except: :destroy

  # GET /auth/:provider/callback
  def callback
    Rails.logger.info 'Received callback request from Facebook sign in.'

    @user = User.from_omniauth(env['omniauth.auth'])

    if @user
      sign_in @user
      flash[:success] = 'Logged in'
      return redirect_to root_path
    else
      redirect_to root_path
    end
  end

  # GET /auth/:provider/failure
  def failure
    flash[:error] = "Something went wrong when logging in. We've been notified and are looking into it."
    redirect_to root_path
  end

  # POST /sessions
  def create
    @login_user = User.where(email: user_params[:email]).first

    return render 'static_pages/home' unless @login_user

    if @login_user.valid_password?(user_params[:password])
      sign_in @login_user
      flash[:success] = 'Logged in'
      return redirect_to root_path, turbolinks: true
    else
      # For the registration form.
      @new_user = User.new
      render 'static_pages/home'
    end
  end

  # DELETE /sessions
  def destroy
    sign_out current_user
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

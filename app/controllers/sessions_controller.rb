class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user_info = auth['info']
    user = User.find_by_google_uid_and_email(auth['uid'], user_info['email'])
    if user
      @user = user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome #{@user.first_name}"
    else
      @user = User.new(email: user_info['email'], first_name: user_info['first_name'], last_name: user_info['last_name'], google_uid: auth['uid'], avatar_url: user_info['image'])
      render 'users/new'
    end
  end

  def destroy
    session['user_id'] = nil
    redirect_to root_path, notice: "You have been signed out"
  end

end

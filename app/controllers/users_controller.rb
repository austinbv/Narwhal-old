class UsersController < ApplicationController
  expose(:user) { User.where(:id => params[:id]).includes([:presentations, :created_presentations]).first}
  expose(:recent_presentations) { Presentation.where("updated_at > ?", 8.days.ago).limit(10).order("updated_at DESC").all }
  expose(:participated_presentations) do
    user.presentations - user.created_presentations
  end
  def index
    redirect_to user_path(current_user) if current_user
  end

  def show
  end

  def create
    @user = User.create(params['user'])
    session[:user_id] = @user.id
    redirect_to root_path, notice: "Welcome #{@user.name}\n your account has been created"
  end

  def new
    @user = User.new
  end

  def update
  end

  def destroy
  end
end
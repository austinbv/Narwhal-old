module UsersHelper
  def login_logout_link
    if current_user
      link_to "Sign out", signout_path
    else
      link_to "Sign in | Create Account", signin_path
    end
  end
end

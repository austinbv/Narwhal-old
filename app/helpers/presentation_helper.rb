module PresentationHelper
  def created_presentations 
    cookies[:created_presentations] ? cookies[:created_presentations].split(",") : []
  end
end

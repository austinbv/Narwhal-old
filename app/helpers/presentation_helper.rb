module PresentationHelper
  def presentation_owner
    presentation.creator == current_user
  end
end

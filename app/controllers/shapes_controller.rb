class ShapesController < ApplicationController
  expose(:presentation) { Presentation.find_by_permalink(params[:presentation_id]) }
  expose(:slide) { Slide.find(params[:slide_id]) }
  expose(:shapes) { slide.shapes }
  expose(:shape) { Shape.find_by_hash(params[:id]) }
  def index
    redirect_to root_path
  end

  def show
    redirect_to root_path
  end

  def create
    shape = Shape.new(params[:shape])
    slide.shapes << shape
    if !slide.presentation.users.include?(current_user) && current_user
      slide.presentation.users << current_user
    end
    if slide.save
      Pusher[presentation.permalink].trigger("#{shape.shape_type}_create_event", shape.attributes)
    end
    render nothing: true
  end

  def destroy
    if shape.destroy
      Pusher[presentation.permalink].trigger("#{shape.shape_type}_destroy_event", {:hash => shape.hash})
    end
    render nothing: true
  end
end

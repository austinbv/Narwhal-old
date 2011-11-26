class PresentationsController < ApplicationController
  expose(:presentation) { Presentation.find_by_permalink(params[:id]) }
  expose(:slides) { presentation.slides }
  expose(:slide) { slides.first }
  expose(:shapes) { slide.shapes }

  def index
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: shapes }
    end
  end

  def create
    presentation = Presentation.new(params['presentation'])
    presentation.slides << Slide.new
    presentation.creator_id = current_user.id if current_user
    respond_to do |format|
      if presentation.save
        format.html { redirect_to short_presentation_path(presentation), notice: "Welcome to your class room, share this url to start collaborating" }
      end
    end
  end

  def update
    presentation.collaberation_on = params[:presentation][:collaberation_on]
    if presentation.save
      Pusher[presentation.permalink].trigger("collaberation_toggle", presentation.collaberation_on)
    end
    render nothing: true
  end
end

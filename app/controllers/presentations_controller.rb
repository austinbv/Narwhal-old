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
    if cookies[:created_presentations]
      cookies[:created_presentations] += ",#{presentation.permalink}"
    else
      cookies[:created_presentations] = presentation.permalink
    end

    respond_to do |format|
      if presentation.save
        format.html { redirect_to short_presentation_path(presentation), notice: "Welcome to your class room, share this url to start collaberating" }
      end
    end
  end
end

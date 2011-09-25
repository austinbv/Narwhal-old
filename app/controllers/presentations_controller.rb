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

    respond_to do |format|
      if presentation.save
        format.html { redirect_to presentation, notice: 'Post was successfully created.' }
      end
    end
  end
end

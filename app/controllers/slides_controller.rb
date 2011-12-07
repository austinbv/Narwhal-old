class SlidesController < PresentationsController
  expose(:presentation) { Presentation.find_by_permalink(params[:presentation_id]) }
  expose(:slides) { presentation.slides }
  expose(:slide)
  expose(:shapes) { slide.shapes }

  def show
    respond_to do |format|
      format.html { render 'presentations/show', :layout => 'presentations'}
      format.json {render json: shapes}
    end
  end

  def create
    slide = Slide.new
    presentation.slides << slide
    if presentation.save
      Pusher[presentation.permalink].trigger("#slide_create_event", nil)
    end
    redirect_to presentation_slide_path(presentation, slide)
  end
end

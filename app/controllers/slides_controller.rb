class SlidesController < ApplicationController
  expose(:presentation) { Presentation.find_by_permalink(params[:id]) }
  expose(:slides) { presentation.slides }
  expose(:slide)
  expose(:shapes) { slide.shapes }

  def index
  end

  def show
  end

end

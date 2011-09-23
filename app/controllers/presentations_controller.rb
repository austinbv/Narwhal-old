class PresentationsController < ApplicationController
  expose(:presentations)
  expose(:presentation) {Presentation.find_by_permalink(params[:id])}
  expose(:slides) { presentation.slides }

  def index
  end

  def create
    if presentation.save
    end
  end
end

class PresentationsController < ApplicationController
  expose(:presentation) do
    if params[:id]
      Presentation.find_by_permalink(params[:id])
    end
  end
  def index
  end



  def create
    if presentation.save

    end
  end

end

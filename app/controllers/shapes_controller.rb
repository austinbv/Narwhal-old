require 'pusher'

Pusher.app_id = '6442'
Pusher.key = 'b106769bbea5c2e08e77'
Pusher.secret = '2e88df3b269a7944292a'

class ShapesController < ApplicationController
  
  expose(:slide) { Slide.find(params[:slide_id]) }
  expose(:shapes) { slide.shapes }
  expose(:shape)
  def index
    redirect_to root_path
  end

  def show
    redirect_to root_path
  end

  def create
    shape = Shape.create(params[:shape])    
#    shape.points = params[:shape][:points].to_s
    if shape.save
      Pusher['test_channel'].trigger('my_event', shape.attributes)
    end
    render nothing: true
  end

  def update

  end
end

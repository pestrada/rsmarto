class SensorsController < ApplicationController
  
  def index
    @sensors = Sensor.all
    
    respond_to do |format|
      format.html
      format.json { render json: @sensors}
    end
  end
  
  def show
    @sensor = Sensor.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render json: @sensor}
    end
  end
  
  def new
    @sensor = Sensor.new
    
    respond_to do |format|
      format.html
      #format.json { render json: @sensor}
    end
  end
  
end

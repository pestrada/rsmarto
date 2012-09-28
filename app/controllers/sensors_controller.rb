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
  
  def create
    @sensor = Sensor.new(params[:sensor])
    
    respond_to do |format|
      if @sensor.save
        format.html { redirect_to @sensor, notice: 'Sensor was successfully created.' }
        format.json { render json: @sensor, status: :created, location: @sensor }
      else
        format.html { render action: "new" }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
end

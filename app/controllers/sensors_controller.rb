class SensorsController < ApplicationController
  
  respond_to :html, :xml, :json
  
  def index
    @sensors = Sensor.all
    respond_with(@sensors)
  end
  
  def show
    @sensor = Sensor.find(params[:id])
    respond_with(@sensor)
  end
  
  def new
    @sensor = Sensor.new
    respond_with(@sensor)
  end
  
  def create
    @sensor = Sensor.new(params[:sensor])
    if @sensor.save then 
      flash[:notice] = 'Sensor was succesfully created.'
    end
    
    respond_with(@sensor, status: :created)
  end
  
  def edit
    @sensor = Sensor.find(params[:id])
    respond_with(@sensor)
  end
  
  def update
    @sensor = Sensor.find(params[:id])
    if @sensor.update_attributes(params[:sensor])
      flash[:notice] = 'Sensor updated'
    end
    
    respond_with(@sensor)
  end
  
  def destroy
    @sensor = Sensor.find(params[:id])
    @sensor.destroy
    
    respond_with(@sensor, location: sensors_path)
  end
    
  def name
    @sensor = Sensor.find(params[:id])
    respond_with(@sensor, only: :name)
  end
  
  def measurement
    @sensor = Sensor.find(params[:id])
    respond_with(@sensor, only: :measurement)
  end
  
  def scale
    @sensor = Sensor.find(params[:id])
    respond_with(@sensor, only: :scale)
  end
  
  def value
    @sensor = Sensor.find(params[:id])
    respond_with(@sensor, only: :value)
  end
  
end

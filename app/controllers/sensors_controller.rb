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
    
    respond_to do |format|
      format.html
      format.json { render json: @sensor.to_json(only: :name) }
      format.xml { render xml: @sensor.to_xml(only: :name) }
    end
  end
  
  def measurement
    @sensor = Sensor.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render json: @sensor.to_json(only: :measurement) }
      format.xml { render xml: @sensor.to_xml(only: :measurement) }
    end
  end
  
  def scale
    @sensor = Sensor.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render json: @sensor.to_json(only: :scale) }
      format.xml { render xml: @sensor.to_xml(only: :scale) }
    end
  end
  
  def value
    @sensor = Sensor.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render json: @sensor.to_json(only: :value) }
      format.xml { render xml: @sensor.to_xml(only: :value) }
    end
  end
  
end

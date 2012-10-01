class SensorsController < ApplicationController
  
  def index
    @sensors = Sensor.all
    
    respond_to do |format|
      format.html
      format.json { render json: @sensors }
      format.xml { render json: @sensors }
    end
  end
  
  def show
    @sensor = Sensor.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render json: @sensor}
      format.xml { render json: @sensor }
    end
  end
  
  def new
    @sensor = Sensor.new
    
    respond_to do |format|
      format.html
      format.json { render json: @sensor}
      format.xml { render json: @sensor }
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
  
  def edit
    @sensor = Sensor.find(params[:id])
  end
  
  def update
    @sensor = Sensor.find(params[:id])
    
    respond_to do |format|
      if @sensor.update_attributes(params[:sensor])
        format.html { redirect_to @sensor, notice: 'Sensor updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sensor.erros, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @sensor = Sensor.find(params[:id])
    @sensor.destroy
    
    respond_to do |format|
      format.html { redirect_to  sensors_path }
      format.json { head :no_content }
    end
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

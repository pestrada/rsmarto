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
      format.json { render json: @sensor}
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
    @sensor = Sensor.find(parms[:id])
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
  
end

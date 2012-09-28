class SmartObjectsController < ApplicationController
  
  def index
    @smart_objects = SmartObject.all
    
    respond_to do |format|
      format.html
      format.json { render json: @smart_objects}
    end
  end
  
  def new
    @smart_object = SmartObject.new
    
    respond_to do |format|
      format.html
      format.json { render json: @sensor}
    end
  end
  
  def create
    @smart_object = SmartObject.new(params[:smart_object])
    
    respond_to do |format|
      if @smart_object.save
        format.html { redirect_to @smart_object, notice: 'Smart object was succesfully created' }
        format.json { render json: @smart_object, status: :created, location: @sensor }
      else
        format.html { render action: 'new' }
        format.json { render json: @sensor.errors, status: :unprocessable_entity}
      end
    end
  end
  
  def show
    @smart_object = SmartObject.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render json: @smart_object}
    end
  end
  
  def destroy
    @smart_object = SmartObject.find(params[:id])
    @smart_object.destroy
    
    respond_to do |format|
      format.html { redirect_to  smart_objects_path }
      format.json { head :no_content }
    end
  end
  
  def edit
    @smart_object = SmartObject.find(params[:id])
  end
  
  def update
    @smart_object = SmartObject.find(params[:id])
    
    respond_to do |format|
      if @smart_object.update_attributes(params[:smart_object])
        format.html { redirect_to @smart_object, notice: 'Smart object was updated' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @smart_object.errors, status: :unprocessable_entity }
      end
    end
  end
  
end

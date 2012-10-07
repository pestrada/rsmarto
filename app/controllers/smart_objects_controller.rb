class SmartObjectsController < ApplicationController
  
  respond_to :html, :xml, :json
  
  def index
    @smart_objects = SmartObject.all
    respond_with(@smart_objects)
  end
  
  def show
    @smart_object = SmartObject.find(params[:id])
    respond_with(@smart_object)
  end
  
  def new
    @smart_object = SmartObject.new
    respond_with(@smart_object)
  end
  
  def create
    @smart_object = SmartObject.new(params[:smart_object])
    if @smart_object.save
      flash[:notice] = 'Smart object was succesfully created'
    end
    
    respond_with(@smart_object, status: :created)
  end
  
  def edit
    @smart_object = SmartObject.find(params[:id])
    respond_with(@smart_object)
  end
  
  def destroy
    @smart_object = SmartObject.find(params[:id])
    @smart_object.destroy
    
    respond_to do |format|
      format.html { redirect_to smart_objects_path }
      format.json { head :no_content }
    end
  end
  
  def update
    @smart_object = SmartObject.find(params[:id])
    if @smart_object.update_attributes(params[:smart_object])
      flash[:notice] = 'Smart object was updated'
    end
    
    respond_with(@smart_object)
  end
  
  def sensors
    @smart_object = SmartObject.find(params[:id])
    @sensors = @smart_object.sensors
    
    respond_with(@sensors)
  end
  
  def object_type
    @smart_object = SmartObject.find(params[:id])
    respond_with(@sensor, only: :object_type)
  end
  
  def name
    @smart_object = SmartObject.find(params[:id])
    respond_with(@sensor, only: :name)
  end
  
  def status
    @smart_object = SmartObject.find(params[:id])
    respond_with(@sensor, only: :status)
  end
  
end

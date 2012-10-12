class ReasonersController < ApplicationController
  
  respond_to :json, :xml
  
  def show
    smart_object = SmartObject.find(params[:smart_object])
    @inference = Reasoner.infer(smart_object)
    respond_with(@inference, only: [:body, :smart_object_id])
  end
  
end

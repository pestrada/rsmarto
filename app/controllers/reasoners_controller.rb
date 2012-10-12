class ReasonersController < ApplicationController
  
  respond_to :json, :xml
  
  def show
    @inference = Reasoner.infer(params[:smart_object])
    respond_with(@inference, only: [:id, :body ])
  end
  
end

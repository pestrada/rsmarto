require 'spec_helper'

describe SensorsController do
  
  let(:sensor) { mock_model(Sensor) }
  let(:sensors) { [sensor] * 3 }
  
  describe 'GET #index' do
    it 'responds with success' do
      Sensor.should_receive(:all).and_return(sensors)
      get :index
      response.should be_success
    end
  end
  
  describe 'GET #show' do
    it 'responds with success' do
      Sensor.should_receive(:find).and_return(sensor)
      get :show, id: sensor
      response.should be_success
    end
  end
  
  describe 'GET #edit' do
    it 'responds with success' do
      Sensor.should_receive(:find).and_return(sensor)
      get :edit, id: sensor
      response.should be_success
    end
  end
  
  describe 'GET #new' do
    it 'responds with success' do
      Sensor.should_receive(:new).and_return(sensor)
      get :new
      response.should be_success
    end
  end
  
  describe 'POST #create' do
    let(:params) { { id: 1, name: 'sensy', measurement: 'temperature', scale: 'C', value: 2 } }
    it 'creates a new sensor' do
      Sensor.should_receive(:new).and_return(sensor)
      sensor.should_receive(:save).and_return(true)
      post :create, params
      response.should redirect_to(sensor)
    end
  end
  
  describe 'PUT #update' do
    it 'updates the sensor attributes' do
      Sensor.should_receive(:find).and_return(sensor)
      sensor.should_receive(:update_attributes).and_return(true)
      put :update, id: sensor
      response.should redirect_to(sensor)
    end
  end
  
  describe 'DELETE #destroy' do
    it 'deletes the sensor' do
      Sensor.should_receive(:find).and_return(sensor)
      sensor.should_receive(:destroy).and_return(true)
      delete :destroy, id: sensor
      response.should redirect_to(sensors_path)
    end
  end
  
end
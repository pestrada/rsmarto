require 'spec_helper'

describe SensorsController do
  
  let(:sensor) { mock_model(Sensor) }
  let(:sensors) { [sensor] }
  
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
  
  describe '#name' do
    let(:name_json) { {name: 'sample_name'}.to_json }
    let(:name_xml) { {name: 'sample_name'}.to_xml }
    
    before do
      Sensor.should_receive(:find).and_return(sensor)
    end
    
    context 'GET json' do
      it 'returns sensor.name in json' do
        sensor.should_receive(:to_json).and_return(name_json)
        get :name, id: sensor, format: :json
        response.body.should == name_json
      end
    end
    
    context 'GET xml' do
      it 'returns sensor.name in xml' do
        sensor.should_receive(:to_xml).and_return(name_xml)
        get :name, id: sensor, format: :xml
        response.body.should == name_xml
      end
    end
  end
  
  describe '#measurement' do
    let(:measurement_json) { {measurement: 'sample_measurement'}.to_json }
    let(:measurement_xml) { {measurement: 'sample_measurement'}.to_xml }
    
    before do
      Sensor.should_receive(:find).and_return(sensor)
    end
    
    context 'GET json' do
      it 'returns sensor.measurement in json' do
        sensor.should_receive(:to_json).and_return(measurement_json)
        get :measurement, id: sensor, format: :json
        response.body.should == measurement_json
      end
    end
    
    context 'GET xml' do
      it 'returns sensor.measurement xml' do
        sensor.should_receive(:to_xml).and_return(measurement_xml)
        get :measurement, id: sensor, format: :xml
        response.body.should == measurement_xml
      end
    end
  end
  
  describe '#scale' do
    let(:scale_json) { {scale: 'sample_scale'}.to_json }
    let(:scale_xml) { {scale: 'sample_scale'}.to_xml }
    
    before do
      Sensor.should_receive(:find).and_return(sensor)
    end
    
    context 'GET json' do
      it 'returns sensor.scale in json' do
        sensor.should_receive(:to_json).and_return(scale_json)
        get :scale, id: sensor, format: :json
        response.body.should == scale_json
      end
    end
    
    context 'GET xml' do
      it 'returns sensor.scale in xml' do
        sensor.should_receive(:to_xml).and_return(scale_xml)
        get :scale, id: sensor, format: :xml
        response.body.should == scale_xml
      end
    end
  end
  
  describe '#value' do
    let(:value_json) { {value: 'sample_value'}.to_json }
    let(:value_xml) { {value: 'sample_value'}.to_xml }
    
    before do
      Sensor.should_receive(:find).and_return(sensor)
    end
    
    context 'GET json' do
      it 'returns sensor.value in json' do
        sensor.should_receive(:to_json).and_return(value_json)
        get :value, id: sensor, format: :json
        response.body.should == value_json
      end
    end
    
    context 'GET xml' do
      it 'returns sensor.value in xml' do
        sensor.should_receive(:to_xml).and_return(value_xml)
        get :value, id: sensor, format: :xml
        response.body.should == value_xml
      end
    end
  end
  
end
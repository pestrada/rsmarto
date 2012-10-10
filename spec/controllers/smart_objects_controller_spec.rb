require 'spec_helper'

describe SmartObjectsController do
  
  let(:smart_object) { mock_model(SmartObject) }
  let(:smart_objects) { [smart_object] }
  
  describe 'GET #index' do
    it 'responds with success' do
      SmartObject.should_receive(:all).and_return(smart_objects)
      get :index
      response.should be_success
    end
  end
  
  describe 'GET #show' do
    it 'responds with success' do
      SmartObject.should_receive(:find).and_return(smart_object)
      get :show, id: smart_object
      response.should be_success
    end
  end
  
  describe 'GET #edit' do
    it 'responds with success' do
      SmartObject.should_receive(:find).and_return(smart_object)
      get :edit, id: smart_object
      response.should be_success
    end
  end
  
  describe 'GET #new' do
    it 'responds with success' do
      SmartObject.should_receive(:new).and_return(smart_object)
      get :new
      response.should be_success
    end
  end
  
  describe 'POST #create' do
    let(:params) { { id: 1, object_type: 'plantita', name: 'planty', status: 'happy'} }
    
    it 'creates a new smart object' do
      SmartObject.should_receive(:new).and_return(smart_object)
      smart_object.should_receive(:save).and_return(true)
      post :create, params
      response.should redirect_to(smart_object)
    end
  end
  
  describe 'PUT #update' do
    it 'updates the smart object attributes' do
      SmartObject.should_receive(:find).and_return(smart_object)
      smart_object.should_receive(:update_attributes).and_return(true)
      put :update, id: smart_object
      response.should redirect_to(smart_object)
    end
  end
  
  describe 'DELETE #destroy' do
    it 'deletes the smart object' do
      SmartObject.should_receive(:find).and_return(smart_object)
      smart_object.should_receive(:destroy).and_return(true)
      delete :destroy, id: smart_object
      response.should redirect_to(smart_objects_path)
    end
  end
  
  describe '#object_type' do
    let(:object_type_json) { {object_type: 'sample_type'}.to_json }
    let(:object_type_xml) { {object_type: 'sample_type'}.to_xml }
    
    before do
      SmartObject.should_receive(:find).and_return(smart_object)
    end
    
    context 'GET json' do
      it 'returns smart_object.object_type in json' do
        smart_object.should_receive(:to_json).and_return(object_type_json)
        get :object_type, id: smart_object, format: :json
        response.body.should == object_type_json
      end
    end
    
    context 'GET xml' do
      it 'returns smart_object.object_type in xml' do
        smart_object.should_receive(:to_xml).and_return(object_type_xml)
        get :object_type, id: smart_object, format: :xml
        response.body.should == object_type_xml
      end
    end
  end
  
  describe '#name' do
    let(:name_json) { {name: 'sample_name'}.to_json }
    let(:name_xml) { {name: 'sample_name'}.to_xml }
    
    before do
      SmartObject.should_receive(:find).and_return(smart_object)
    end
    
    context 'GET json' do
      it 'returns smart_object.name in json' do
        smart_object.should_receive(:to_json).and_return(name_json)
        get :name, id: smart_object, format: :json
        response.body.should == name_json
      end
    end
    
    context 'GET xml' do
      it 'returns smart_object.name in xml' do
        smart_object.should_receive(:to_xml).and_return(name_xml)
        get :name, id: smart_object, format: :xml
        response.body.should == name_xml
      end
    end
  end
  
  describe '#status' do
    let(:status_json) { {status: 'sample_status'}.to_json }
    let(:status_xml) { {status: 'sample_status'}.to_xml }
    
    before do
      SmartObject.should_receive(:find).and_return(smart_object)
    end
    
    context 'GET json' do
      it 'returns smart_object.status in json' do
        smart_object.should_receive(:to_json).and_return(status_json)
        get :status, id: smart_object, format: :json
        response.body.should == status_json
      end
    end
    
    context 'GET xml' do
      it 'returns smart_object.status in xml' do
        smart_object.should_receive(:to_xml).and_return(status_xml)
        get :status, id: smart_object, format: :xml
        response.body.should == status_xml
      end
    end
  end
  
end
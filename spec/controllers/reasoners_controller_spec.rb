require 'spec_helper'

describe ReasonersController do
  
  let(:inference) { mock_model(Inference) }
  let(:smart_object) { mock_model(SmartObject) }
  
  describe '#infer' do
    let(:inference_json) { {body: 'sample_body', smart_object_id: 1}.to_json }
    let(:inference_xml) { {body: 'sample_body', smart_object_id: 1}.to_xml }
    
    before do
      SmartObject.should_receive(:find).and_return(smart_object)
      Reasoner.should_receive(:infer).with(smart_object).and_return(inference)
    end
    
    context 'GET json' do
      it 'returns the inference in json' do
        inference.should_receive(:to_json).and_return(:inference_json)
        get :show, smart_object: 1, format: :json
        response.body.should == inference_json
      end
    end
    
    context 'GET xml' do
      it 'returns the inference in xml' do
        inference.should_receive(:to_xml).and_return(:inference_xml)
        get :show, smart_object: 1, format: :xml
        response.body.should == inference_xml
      end
    end
  end

end

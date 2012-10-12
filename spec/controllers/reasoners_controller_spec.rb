require 'spec_helper'

describe ReasonersController do
  
  let(:inference) { mock_model(Inference) }
  
  describe '#infer' do
    let(:inference_json) { {body: 'sample_body', id: 1}.to_json }
    let(:inference_xml) { {body: 'sample_body', id: 1}.to_xml }
    
    before do
      Reasoner.should_receive(:infer).and_return(inference)
    end
    
    context 'GET json' do
      let(:reasoner) { stub_model(Reasoner) }
      
      it 'returns the inference in json' do
        reasoner.should_receive(:to_json).and_return(:inference_json)
        get :show, id: 1, format: :json
        response.body.should == inference_json
      end
    end
    
    context 'GET xml' do
      it 'returns the inference in xml' do
        inference.should_receive(:to_xml).and_return(:inference_xml)
        get :show, format: :xml
        response.body.should == inference_xml
      end
    end
  end

end

require 'spec_helper'

describe SmartObject do
  
  subject(:smart_object) { SmartObject.new }
  
  it 'has a valid object_type' do
    smart_object.object_type = 'example-type'
    smart_object.object_type.should_not be_blank
  end
  
  it 'has a valid name' do
    smart_object.name = 'smarty'
    smart_object.name.should_not be_blank
  end
  
  it 'has a valid status' do
    smart_object.status = 'good'
    smart_object.status.should_not be_blank
  end
  
end

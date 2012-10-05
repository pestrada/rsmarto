require 'spec_helper'

describe Sensor do
  
  subject(:sensor) { Sensor.new }
  
  it 'has a valid name' do
    sensor.name = 'sensy'
    sensor.name.should_not be_blank
  end
  
  it 'has a valid measurement' do
    sensor.measurement = 'temperature'
    sensor.measurement.should_not be_blank
  end
  
  it 'has a valid scale' do
    sensor.scale = '%'
    sensor.scale.should_not be_blank
  end
  
  it 'has a valid value' do
    sensor.value = '10'
    sensor.value.should_not be_blank
  end
  
end
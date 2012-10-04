require 'spec_helper'

describe Sensor do
  
  subject(:sensor) { Sensor.new }
  
  it 'should has a valid name' do
    sensor.name = 'sensy'
    sensor.name.should_not be_blank
  end
  
  it 'should has a valid measurement' do
    sensor.measurement = '%'
    sensor.measurement.should_not be_blank
  end
  
end
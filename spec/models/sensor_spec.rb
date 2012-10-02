require 'spec_helper'

describe Sensor do
  it 'is named Toby' do
    sensor = Sensor.new
    sensor.name = 'John'
    sensor.name.should == 'Toby'
  end
end

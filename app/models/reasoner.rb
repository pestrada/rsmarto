require 'rexml/document'

class Reasoner < ActiveRecord::Base
  
  attr_accessible :name
  
  def self.infer(id)
    smart_object = SmartObject.find(id)
    status = apply_rules(smart_object)
    
    data = "<status>#{status}</status>"
    
    inference = smart_object.inferences.new
    inference.body = data
    inference.save
    return inference
  end
  
  def self.apply_rules(smart_object)
    status = 'happy'
    smart_object.sensors.each do |sensor|
      case sensor.measurement
      when 'temperature'
        if sensor.value >= 28
          status = 'heating'
        end
      when 'humidity'
        if sensor.value <= 65
          status = 'thirsty'
        end
      end
    end
    return status
  end
  
end

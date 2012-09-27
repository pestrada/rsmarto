class Sensor < ActiveRecord::Base
  attr_accessible :name, :measurement, :scale, :value
  
  validates_presence_of :name, :measurement, :scale, :value, :on => :create, :message => "can't be blank"
end

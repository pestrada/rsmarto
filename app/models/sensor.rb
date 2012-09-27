class Sensor < ActiveRecord::Base
  attr_accessible :name, :scale, :type, :value
end

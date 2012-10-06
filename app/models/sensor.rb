class Sensor < ActiveRecord::Base
  attr_accessible :name, :measurement, :scale, :value
  
  belongs_to :smart_object
  
  validates :name, :measurement, :scale, :value, presence: { message: "can't be blank" }
end

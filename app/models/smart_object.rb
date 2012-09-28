class SmartObject < ActiveRecord::Base
  attr_accessible :object_type, :name, :status
  
  has_many :sensors, :dependent => :destroy
  
  validates_presence_of :object_type, :name, :status, :on => :create, :message => "can't be blank"
end

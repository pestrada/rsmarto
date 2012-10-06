class SmartObject < ActiveRecord::Base
  attr_accessible :object_type, :name, :status
  
  has_many :sensors, dependent: :destroy
  
  validates :object_type, :name, :status, presence: { :message => "can't be blank" }
end

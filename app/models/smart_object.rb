class SmartObject < ActiveRecord::Base
  attr_accessible :object_type, :name, :status
  
  has_many :sensors, dependent: :destroy
  has_many :inferences, dependent: :destroy
  
  validates :object_type, :name, :status, presence: { :message => "can't be blank" }
end

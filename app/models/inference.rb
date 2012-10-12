class Inference < ActiveRecord::Base
  
  attr_accessible :body
  
  belongs_to :smart_object
  
end
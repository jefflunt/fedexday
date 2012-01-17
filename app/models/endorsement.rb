class Endorsement < ActiveRecord::Base
  belongs_to :idea
  
  validates :name, :presence => true
end

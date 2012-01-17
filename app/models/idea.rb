class Idea < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :endorsements, :dependent => :destroy
  
  validates :title, :presence => true
  validates :body, :presence => true
end

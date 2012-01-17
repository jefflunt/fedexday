class Idea < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :endorsements, :dependent => :destroy
end

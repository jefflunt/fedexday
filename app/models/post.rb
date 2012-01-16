class Post < ActiveRecord::Base
  has_many :comments
  has_many :subscriptions
  
  accepts_nested_attributes_for :comments
end

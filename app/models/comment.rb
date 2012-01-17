class Comment < ActiveRecord::Base
  belongs_to :idea
  
  validates :body, :presence => true
end

class Idea < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :endorsements, :dependent => :destroy
  
  validates :title, :presence => true
  validates :body, :presence => true
  
  scope :long_expired, where("(updated_at < '#{1.week.ago}' AND scratched = 't') OR (updated_at < '#{9.months.ago}')")
end

require 'populator'
require 'faker'

FactoryGirl.define do

  factory :idea do |i|
    i.title     {Populator.words(3..7)}
    i.body      {Populator.paragraphs(1..3)}
    i.scratched {false}
  end
  
  factory :comment do |c|
    c.idea
    c.body      {Populator.words(3..27)}
  end
  
  factory :endorsement do |e|
    e.idea
    e.name      {Faker::Name.first_name}
  end

end

namespace :db do  
  desc "Erase database"
  task :erase => :environment do
    puts "Erasing..."
    
    [Idea, Comment, Endorsement].each(&:delete_all)
  end
  
  desc "Erase and fill database"
  task :populate => [:environment, :erase] do
    require 'populator'
    require 'faker'
    
    puts "Populating: enjoy this random pattern generator while you wait..."
    
    50.times do
      Factory.create(:idea)
      print (['\\', '/', '_', '|'])[rand(4)]
    end
    
    Idea.all.each do |i|
      rand(11).times do
        Factory.create(:comment, :idea_id => i.id)
        print (['\\', '/', '_', '|'])[rand(4)]
      end
      
      rand(25).times do
        Factory.create(:endorsement, :idea_id => i.id)
        print (['\\', '/', '_', '|'])[rand(4)]
      end
    end
        
    puts ""
  end
end


CAPIFY = YAML::load( File.open( './config/cap_config.yml' ) )

set :application, CAPIFY['app_name']
set :repository,  CAPIFY['repo']

set :scm, :git
set :user, CAPIFY['remote_deploy_user']
set :user_sudo, false
set :deploy_to, CAPIFY['remote_deploy_path']
set :deploy_via, :remote_cache

role :web, CAPIFY['web_host']
role :app, CAPIFY['app_host']
role :db,  CAPIFY['db_host'], :primary => true

namespace :deploy do
  desc "Stops Passenger"
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/stop.txt"
  end
  
  desc "Starts Passenger"
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/start.txt"
  end
  
  desc "Restarts Passenger"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "Makes a copy of the SQLite database"
  task :backup_db do
    stop
    run "cp #{current_path}/db/staging.sqlite ~/stg-backup-#{Date.today.to_s}.#{Time.now.to_i}.sqlite"
    run "cp #{current_path}/db/production.sqlite ~/prod-backup-#{Date.today.to_s}.#{Time.now.to_i}.sqlite"
    start
  end
end

after 'deploy:update_code', 'deploy:backup_database'

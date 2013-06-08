namespace :travis do
  desc "Create configuration files from examples"
  task :setup do
    puts 'Creating config/database.yml'
    system("cp config/database.yml.travis config/database.yml") and puts "... done"
  end

  desc "Run specs"
  task :ci => ['db:create', 'db:migrate', :spec]
end

task :travis => 'travis:ci'

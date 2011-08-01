begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

# lib/tasks/headless_jasmine.rake
namespace :jasmine do
  namespace :ci do
    desc "Run Jasmine CI build headlessly"
    task :headless do
      Headless.ly do
        puts "Running Jasmine Headlessly"
        Rake::Task['jasmine:ci'].invoke
      end
    end
  end
end

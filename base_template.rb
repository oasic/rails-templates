## git_template.rb
# - based off of http://railscasts.com/episodes/148-app-templates-in-rails-2-3

run  "echo 'including git_template'"

## Gems/plugins
run "echo 'Gems/plugins'"
if yes?("Install less and more for CSS?")
  gem 'less' 
  plugin 'more', :git => 'git://github.com/cloudhead/more.git'
end
gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com' 
if yes?("Do you want to use the AnnotateModels plugin?")
  plugin "annotate_models", :svn => "http://repo.pragprog.com/svn/Public/plugins/annotate_models"
end

run "echo 'Gems for testing'"
gem 'rr', :source => 'http://gemcutter.org'  if yes?("Install rr gem?")
gem 'forgery', :source => 'http://gemcutter.org' if yes?("Install forgery gem?")
rake "gems:install"



## Delete the index page
run "rm public/index.html"


## Git
if yes?("Do you want to use Git?")
  git :init
  file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END
  run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
  run "cp config/database.yml config/example_database.yml"
  git :add => ".", :commit => "-m 'initial commit'"
end















####################### COMMENTED OUT BELOW ##############################

### notes below left in for an example
#if yes?("Do you want to use RSpec?")
#  plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"
#  plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"
#  generate :rspec
#end

# auth_template.rb
#load_template "/Users/rbates/code/base_template.rb"

#name = ask("What do you want a user to be called?")
#generate :nifty_authentication, name
#rake "db:migrate"

#git :add => ".", :commit => "-m 'adding authentication'"

#generate :controller, "welcome index"
#route "map.root :controller => 'welcome'"

#git :add => ".", :commit => "-m 'adding welcome controller'"

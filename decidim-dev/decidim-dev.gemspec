# frozen_string_literal: true
$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require_relative "../decidim-core/lib/decidim/core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "decidim-dev"
  s.version     = Decidim.version
  s.authors     = ["Josep Jaume Rey Peroy", "Marc Riera Casals", "Oriol Gual Oliva"]
  s.email       = ["josepjaume@gmail.com", "mrc2407@gmail.com", "oriolgual@gmail.com"]
  s.homepage    = ""
  s.summary     = "Decidim Dev tools"
  s.description = "Utilities and tools we need to develop Decidim"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "factory_girl_rails"
  s.add_dependency "database_cleaner", "~> 1.5.0"
  s.add_dependency "capybara", "~> 2.4"
  s.add_dependency "rspec-rails", "~> 3.5"
  s.add_dependency "byebug"
  s.add_dependency "wisper-rspec"
  s.add_dependency "pg"
  s.add_dependency "listen"
  s.add_dependency "launchy"
  s.add_dependency "i18n-tasks", "~> 0.9.5"
end

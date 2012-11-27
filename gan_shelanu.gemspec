$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gan_shelanu/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gan_shelanu"
  s.version     = GanShelanu::VERSION
  s.authors     = ["Isaac Betesh"]
  s.email       = ["iybetesh@gmail.com"]
  s.homepage    = "https://github.com/betesh/gan_shelanu"
  s.summary     = "Gan Shelanu backbone web application"
  s.description = `cat README.rdoc`

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "easy_rails_authentication", "~> 0.0.7"
  s.add_dependency "zurb-foundation", "~> 3.2.2"
  s.add_dependency "compass-rails", "~> 1.0"
  s.add_dependency "simple_form", "~> 2.0"
  s.add_dependency "validates_email_format_of", "~> 1.5.3"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end

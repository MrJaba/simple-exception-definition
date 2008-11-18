Gem::Specification.new do |s|
  s.name         = "simple-exception-definition"
  s.version      = "0.1"
  s.platform     = Gem::Platform::RUBY
  s.author       = "Tom Crinson"
  s.email        = "the.jaba@gmail.com"
  s.summary      = "DRY up your exception definitions"
  s.description  = s.summary
  s.require_path = "lib"
  s.files        = %w( MIT-LICENSE Rakefile ) + Dir["{lib}/**/*"]
end

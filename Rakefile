require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rake/clean'

include FileUtils

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the simple_exception_definition plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the simple_exception_definition plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'SimpleExceptionDefinition'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

NAME = "simple-exception-definition"
GEMVERSION = "0.1"

CLEAN.include "pkg"

spec = Gem::Specification.new do |s|
  s.name         = NAME
  s.version      = GEMVERSION
  s.platform     = Gem::Platform::RUBY
  s.author       = "Tom Crinson"
  s.email        = "the.jaba@gmail.com"
  s.summary      = "DRY up your exception definitions"
  s.description  = s.summary
  s.require_path = "lib"
  s.files        = %w( MIT-LICENSE Rakefile ) + Dir["{lib}/**/*"]
end

Rake::GemPackageTask.new(spec) do |package|
  package.gem_spec = spec
end

desc "Create a gemspec file"
task :make_spec do
  File.open("#{NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

desc "Run :package and install the resulting .gem"
task :install => :package do
  sh %{sudo gem install --local pkg/#{NAME}-#{GEMVERSION}.gem --no-rdoc --no-ri}
end

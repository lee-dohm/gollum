
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'date'
require 'gollum'

Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'
  s.required_ruby_version = ">= 1.8.7"

  s.name              = 'gollum'
  s.version           = Gollum::VERSION
  s.date              = Date.today.to_s
  s.rubyforge_project = 'gollum'

  s.summary     = "A simple, Git-powered wiki."
  s.description = "A simple, Git-powered wiki with a sweet API and local frontend."

  s.authors  = ["Tom Preston-Werner", "Rick Olson", "Lee Dohm"]
  s.email    = 'lee@liftedstudios.com'
  s.homepage = 'http://github.com/lee-dohm/gollum'

  s.require_paths = %w[lib]

  s.executables = ["gollum"]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  s.add_dependency('grit', '~> 2.5.0')
  s.add_dependency('github-markup', ['>= 0.7.4', '< 1.0.0'])
  s.add_dependency('github-markdown', '~> 0.5.1')
  s.add_dependency('pygments.rb', '~> 0.3.2')
  s.add_dependency('sinatra', '~> 1.3.3')
  s.add_dependency('mustache', ['>= 0.99.4', '< 1.0.0'])
  s.add_dependency('sanitize', '~> 2.0.3')
  s.add_dependency('nokogiri', '~> 1.5.5')
  s.add_dependency('useragent', '~> 0.4.12')
  s.add_dependency('stringex', '~> 1.4.0')

  s.add_development_dependency('RedCloth', '~> 4.2.9')
  s.add_development_dependency('mocha', '~> 0.12.7')
  s.add_development_dependency('org-ruby', '~> 0.7.2')
  s.add_development_dependency('shoulda', '~> 3.3.1')
  s.add_development_dependency('rack-test', '~> 0.6.2')
  s.add_development_dependency('wikicloth', '~> 0.8.0')
  s.add_development_dependency('rake', '~> 0.9')
  s.add_development_dependency('pry', '~> 0.9.10')
  # required by pry
  s.add_development_dependency('rb-readline', '~> 0.4.2')

  s.files = `git ls-files`.
    split("\n").
    sort.
    reject { |file| file =~ /^\./ }.
    reject { |file| file =~ /^(rdoc|pkg)/ }

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end

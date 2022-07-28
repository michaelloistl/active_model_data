lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_model_data/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_model_data'
  spec.version       = ActiveModelData::VERSION
  spec.authors       = ['Michael Loistl']
  spec.email         = ['michael@aplo.io']

  spec.summary       = 'Simple data-storage fields for ActiveRecord'
  spec.homepage      = 'https://github.com/michaelloistl/active_model_data'
  spec.license       = 'MIT'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activemodel', '>= 4.0'
  spec.add_runtime_dependency 'activerecord', '>= 4.0'
  spec.add_runtime_dependency 'activesupport', '>= 4.0'

  spec.add_development_dependency 'activemodel', '>= 4.0'
  spec.add_development_dependency 'activerecord', '>= 4.0'
  spec.add_development_dependency 'activesupport', '>= 4.0'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'pry-remote'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-nc'
  spec.add_development_dependency 'sqlite3'
end

Gem::Specification.new do |spec|
  spec.name          = 'lita-mingle'
  spec.version       = '0.1.0'
  spec.authors       = ['Riley Shott']
  spec.email         = %w(riley.shott@visioncritical.com)
  spec.description   = 'A Lita Plugin for creating/updating cards in Mingle'
  spec.summary       = 'A Lita Plugin for creating/updating cards in Mingle'
  spec.homepage      = 'https://github.com/visioncritical/lita-mingle'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.7'
  spec.add_runtime_dependency 'mingle-api', '>= 0.0.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec', '>= 3.0.0'
  spec.add_development_dependency 'rubocop', '>= 0.28.0'
end

# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gloves/country/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vladimir Moravec"]
  gem.email         = ["vmoravec@suse.com"]
  gem.description   = "Gloves configuration toolset for timezone, language and keyboard"
  gem.summary       = "Country configuration"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gloves-country"
  gem.require_paths = ["lib"]
  gem.version       = Gloves::Country::VERSION

  gem.add_runtime_dependency('config_agent')
  gem.add_runtime_dependency('config_agent_country')
  gem.add_runtime_dependency('gloves-core')
  gem.add_runtime_dependency('gli','2.0.0.rc4')
end

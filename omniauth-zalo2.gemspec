require_relative 'lib/omniauth/zalo2/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-zalo2"
  spec.version       = Omniauth::Zalo2::VERSION
  spec.authors       = ["trungle1612"]
  spec.email         = ["lexuantrung1612@gmail.com"]

  spec.summary       = "Zalo OAuth2 strategy for OmniAuth"
  spec.description   = "Zalo OAuth2 strategy for OmniAuth"
  spec.homepage      = "https://github.com/trungle1612/omniauth-zalo2"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth'
  spec.add_dependency 'omniauth-oauth2'
end

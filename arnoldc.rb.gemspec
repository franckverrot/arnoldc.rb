# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "arnoldc.rb"
  spec.version       = "1.0.0"
  spec.authors       = ["Franck Verrot"]
  spec.email         = ["franck@verrot.fr"]
  spec.summary       = %q{arnoldc Ruby implementation}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/franckverrot/arnoldc.rb"
  spec.license       = "GPLv3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_development_dependency "bundler", "~> 1.5"
end

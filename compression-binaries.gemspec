# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "compression-binaries"
  spec.version       = "0.1.0"
  spec.authors       = ["Stefan Wienert"]
  spec.email         = ["stefan.wienert@pludoni.de"]

  spec.summary       = %q{Provides binaries to zopfli and brotli}
  spec.description   = %q{Provides binaries to zopfli and brotli}
  spec.homepage      = "https://github.com/pludoni/compression-binaries-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files exe lib libexec -z`.split("\x0")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end

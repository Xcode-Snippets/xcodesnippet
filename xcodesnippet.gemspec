# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "xcodesnippet/version"

Gem::Specification.new do |s|
  s.name        = "xcodesnippet"
  s.authors     = ["Mattt Thompson"]
  s.email       = "m@mattt.me"
  s.license     = "MIT"
  s.homepage    = "http://mattt.me"
  s.version     = XcodeSnippet::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "xcodesnippet"
  s.description = "A command-line interface for installing Xcode Snippets."

  s.add_dependency "yaml-front-matter"
  s.add_dependency "plist"
  s.add_dependency "commander", "~> 4.1"

  s.add_development_dependency "rake"

  s.files         = Dir["./**/*"].reject { |file| file =~ /\.\/(bin|log|pkg|script|spec|test|vendor)/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

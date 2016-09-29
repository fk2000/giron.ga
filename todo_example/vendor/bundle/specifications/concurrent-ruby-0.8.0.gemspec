# -*- encoding: utf-8 -*-
# stub: concurrent-ruby 0.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "concurrent-ruby"
  s.version = "0.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jerry D'Antonio"]
  s.date = "2015-01-25"
  s.description = "    Modern concurrency tools including agents, futures, promises, thread pools, actors, supervisors, and more.\n    Inspired by Erlang, Clojure, Go, JavaScript, actors, and classic concurrency patterns.\n"
  s.email = "jerry.dantonio@gmail.com"
  s.extra_rdoc_files = ["README.md", "LICENSE.txt", "CHANGELOG.md"]
  s.files = ["CHANGELOG.md", "LICENSE.txt", "README.md"]
  s.homepage = "http://www.concurrent-ruby.com"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.5.1"
  s.summary = "Modern concurrency tools for Ruby. Inspired by Erlang, Clojure, Scala, Haskell, F#, C#, Java, and classic concurrency patterns."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ref>, [">= 1.0.5", "~> 1.0"])
    else
      s.add_dependency(%q<ref>, [">= 1.0.5", "~> 1.0"])
    end
  else
    s.add_dependency(%q<ref>, [">= 1.0.5", "~> 1.0"])
  end
end

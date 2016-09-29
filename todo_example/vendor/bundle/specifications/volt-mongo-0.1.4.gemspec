# -*- encoding: utf-8 -*-
# stub: volt-mongo 0.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "volt-mongo"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ryan Stout"]
  s.date = "2015-10-19"
  s.email = ["ryan@agileproductions.com"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Mongo database drivers for volt"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongo>, ["~> 2.1.2"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<mongo>, ["~> 2.1.2"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<mongo>, ["~> 2.1.2"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end

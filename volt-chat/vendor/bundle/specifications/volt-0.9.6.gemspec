# -*- encoding: utf-8 -*-
# stub: volt 0.9.6 ruby lib

Gem::Specification.new do |s|
  s.name = "volt"
  s.version = "0.9.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ryan Stout"]
  s.date = "2015-10-17"
  s.description = "A reactive Ruby web framework where your Ruby code runs on both the server and the client (via Opal)."
  s.email = ["ryan@agileproductions.com"]
  s.executables = ["volt"]
  s.files = ["bin/volt"]
  s.homepage = "http://voltframework.com"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1")
  s.rubygems_version = "2.5.1"
  s.summary = "A reactive Ruby web framework."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, ["~> 0.19.0"])
      s.add_runtime_dependency(%q<pry>, ["~> 0.10.1"])
      s.add_runtime_dependency(%q<rack>, ["~> 1.5.0"])
      s.add_runtime_dependency(%q<sass>, ["~> 3.4.15"])
      s.add_runtime_dependency(%q<listen>, ["~> 3.0.1"])
      s.add_runtime_dependency(%q<configurations>, ["~> 2.0.0.pre"])
      s.add_runtime_dependency(%q<opal>, ["< 0.9", ">= 0.8.0"])
      s.add_runtime_dependency(%q<bundler>, [">= 1.5"])
      s.add_runtime_dependency(%q<faye-websocket>, ["~> 0.10.0"])
      s.add_runtime_dependency(%q<sprockets-helpers>, ["~> 1.2.1"])
      s.add_runtime_dependency(%q<concurrent-ruby>, ["= 0.8.0"])
      s.add_runtime_dependency(%q<bcrypt>, ["~> 3.1.9"])
      s.add_development_dependency(%q<rspec>, ["~> 3.2.0"])
      s.add_development_dependency(%q<opal-rspec>, ["~> 0.4.3"])
      s.add_development_dependency(%q<capybara>, ["~> 2.4.4"])
      s.add_development_dependency(%q<selenium-webdriver>, ["~> 2.47.1"])
      s.add_development_dependency(%q<chromedriver-helper>, ["~> 1.0.0"])
      s.add_development_dependency(%q<poltergeist>, ["~> 1.5.0"])
      s.add_development_dependency(%q<thin>, ["~> 1.6.3"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.8.1"])
      s.add_development_dependency(%q<guard>, ["= 2.12.7"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 4.3.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0.4"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.31.0"])
    else
      s.add_dependency(%q<thor>, ["~> 0.19.0"])
      s.add_dependency(%q<pry>, ["~> 0.10.1"])
      s.add_dependency(%q<rack>, ["~> 1.5.0"])
      s.add_dependency(%q<sass>, ["~> 3.4.15"])
      s.add_dependency(%q<listen>, ["~> 3.0.1"])
      s.add_dependency(%q<configurations>, ["~> 2.0.0.pre"])
      s.add_dependency(%q<opal>, ["< 0.9", ">= 0.8.0"])
      s.add_dependency(%q<bundler>, [">= 1.5"])
      s.add_dependency(%q<faye-websocket>, ["~> 0.10.0"])
      s.add_dependency(%q<sprockets-helpers>, ["~> 1.2.1"])
      s.add_dependency(%q<concurrent-ruby>, ["= 0.8.0"])
      s.add_dependency(%q<bcrypt>, ["~> 3.1.9"])
      s.add_dependency(%q<rspec>, ["~> 3.2.0"])
      s.add_dependency(%q<opal-rspec>, ["~> 0.4.3"])
      s.add_dependency(%q<capybara>, ["~> 2.4.4"])
      s.add_dependency(%q<selenium-webdriver>, ["~> 2.47.1"])
      s.add_dependency(%q<chromedriver-helper>, ["~> 1.0.0"])
      s.add_dependency(%q<poltergeist>, ["~> 1.5.0"])
      s.add_dependency(%q<thin>, ["~> 1.6.3"])
      s.add_dependency(%q<coveralls>, ["~> 0.8.1"])
      s.add_dependency(%q<guard>, ["= 2.12.7"])
      s.add_dependency(%q<guard-rspec>, ["~> 4.3.0"])
      s.add_dependency(%q<rake>, ["~> 10.0.4"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.0"])
      s.add_dependency(%q<rubocop>, ["~> 0.31.0"])
    end
  else
    s.add_dependency(%q<thor>, ["~> 0.19.0"])
    s.add_dependency(%q<pry>, ["~> 0.10.1"])
    s.add_dependency(%q<rack>, ["~> 1.5.0"])
    s.add_dependency(%q<sass>, ["~> 3.4.15"])
    s.add_dependency(%q<listen>, ["~> 3.0.1"])
    s.add_dependency(%q<configurations>, ["~> 2.0.0.pre"])
    s.add_dependency(%q<opal>, ["< 0.9", ">= 0.8.0"])
    s.add_dependency(%q<bundler>, [">= 1.5"])
    s.add_dependency(%q<faye-websocket>, ["~> 0.10.0"])
    s.add_dependency(%q<sprockets-helpers>, ["~> 1.2.1"])
    s.add_dependency(%q<concurrent-ruby>, ["= 0.8.0"])
    s.add_dependency(%q<bcrypt>, ["~> 3.1.9"])
    s.add_dependency(%q<rspec>, ["~> 3.2.0"])
    s.add_dependency(%q<opal-rspec>, ["~> 0.4.3"])
    s.add_dependency(%q<capybara>, ["~> 2.4.4"])
    s.add_dependency(%q<selenium-webdriver>, ["~> 2.47.1"])
    s.add_dependency(%q<chromedriver-helper>, ["~> 1.0.0"])
    s.add_dependency(%q<poltergeist>, ["~> 1.5.0"])
    s.add_dependency(%q<thin>, ["~> 1.6.3"])
    s.add_dependency(%q<coveralls>, ["~> 0.8.1"])
    s.add_dependency(%q<guard>, ["= 2.12.7"])
    s.add_dependency(%q<guard-rspec>, ["~> 4.3.0"])
    s.add_dependency(%q<rake>, ["~> 10.0.4"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.0"])
    s.add_dependency(%q<rubocop>, ["~> 0.31.0"])
  end
end

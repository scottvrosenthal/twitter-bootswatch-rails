# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "twitter/bootswatch/rails/version"

Gem::Specification.new do |s|
  s.name        = "twitter-bootswatch-rails"
  s.version     = Twitter::Bootswatch::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.8.11'
  s.license     = 'MIT'
  s.licenses    = ['MIT', 'GPL-2']
  s.authors     = ["Scott V. Rosenthal"]
  s.email       = ["sr7575@gmail.com"]
  s.homepage    = "https://github.com/scottvrosenthal/twitter-bootswatch-rails"
  s.summary     = %q{Bootstrap toolkit for Rails Asset Pipeline with less-rails}
  s.description = %q{twitter-bootswatch-rails gem integrates Bootstrap for Rails Asset Pipeline with less-rails}

  s.files = Dir["lib/twitter/**/*"] + Dir["lib/generators/**/*"] + Dir["vendor/**/*"] + ["lib/twitter-bootswatch-rails.rb"]

  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency             'railties',   '>= 3.1'
  s.add_dependency             'less-rails', '>= 2.3'
  s.add_dependency             'execjs', '>= 1.4.0'

  s.add_development_dependency 'rails', '>= 3.1'
  s.add_development_dependency 'therubyracer', '>= 0.11.1'

  s.post_install_message = "Important: You may need to add a javascript runtime to your Gemfile in order for bootstrap's LESS files to compile to CSS. \n\n" \
  "**********************************************\n\n" \
  "ExecJS supports these runtimes:\n\n" \
  "therubyracer - Google V8 embedded within Ruby\n\n" \
  "therubyrhino - Mozilla Rhino embedded within JRuby\n\n" \
  "Node.js\n\n" \
  "**********************************************"
end

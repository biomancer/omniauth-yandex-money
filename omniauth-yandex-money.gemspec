# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/yandex-money/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-yandex-money'
  s.version  = OmniAuth::YandexMoney::VERSION
  s.authors  = ['Sergey Merkulov']
  s.email    = ['biomancer@gmail.com']
  s.summary  = 'Provides an OmniAuth strategy for Yandex.Money'
  s.homepage = 'https://github.com/biomancer/omniauth-yandex-money'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.0'

  s.add_development_dependency 'rspec', '~> 2.7.0'
  s.add_development_dependency 'rake'
end
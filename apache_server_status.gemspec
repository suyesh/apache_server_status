# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apache_server_status/version'

Gem::Specification.new do |spec|
    spec.name = 'apache_server_status'
    spec.version       = ApacheServerStatus::VERSION
    spec.authors       = ['Suyesh Bhandari']
    spec.email         = ['suyeshb@gmail.com']

    spec.summary       = 'Beautify apache server status'
    spec.description   = 'Beautify apache server status'
    spec.homepage      = 'https://github.com/suyesh/apache_server_status'
    spec.license       = 'MIT'

    if spec.respond_to?(:metadata)
        spec.metadata['allowed_push_host'] = 'https://rubygems.org'
    else
        raise 'RubyGems 2.0 or newer is required to protect against ' \
          'public gem pushes.'
    end

    spec.files = `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
    end

    spec.bindir        = 'exe'
    spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
    spec.require_paths = ['lib']

    spec.add_development_dependency 'bundler', '~> 1.14'
    spec.add_development_dependency 'rake', '~> 10.0'
    spec.add_dependency 'sinatra', '~> 1.4', '>= 1.4.8'
    spec.add_dependency 'sinatra-contrib'
    spec.add_dependency 'nokogiri', '~> 1.7', '>= 1.7.0.1'
    spec.add_dependency 'thor', '~> 0.19.4'
end

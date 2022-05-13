# frozen_string_literal: true

require_relative "lib/gakkenid/api/version"

Gem::Specification.new do |spec|
  spec.name = "gakkenid"
  spec.version = Gakkenid::API::VERSION
  spec.authors = ["YOSHIOKA Eiichiro"]
  spec.email = ["e.yoshioka@gakken.co.jp"]

  spec.summary = "GakkenID API Wrapper for Ruby"
  spec.description = ""
  spec.homepage = "https://gakken-leap.co.jp/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://examples.com'"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "examples-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

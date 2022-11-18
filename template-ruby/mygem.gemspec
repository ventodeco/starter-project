require_relative 'lib/mygem/version'

Gem::Specification.new do |spec|
  spec.name = 'mygem'
  spec.version = Mygem::VERSION
  spec.authors = ['John Doe']
  spec.email = ['john.doe@gmail.com']

  spec.summary = 'Ruby code for the gem mygem.'
  spec.required_ruby_version = '>= 3.1.2'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end

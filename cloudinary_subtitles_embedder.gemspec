# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudinary_subtitles_embedder/version'

Gem::Specification.new do |spec|
  spec.name          = "cloudinary_subtitles_embedder"
  spec.version       = CloudinarySubtitlesEmbedder::VERSION
  spec.authors       = ["Tuval Rotem"]
  spec.email         = ["tuva.roteml@gmail.com"]

  spec.summary       = %q{add subtitles to cloudinary hosted video}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    # f.match(%r{^(test|spec|features)/})
  # end
  spec.files         = %w[lib/cloudinary_subtitles_embedder.rb
                          lib/cloudinary_subtitles_embedder/subtitle_line.rb
                          lib/cloudinary_subtitles_embedder/subtitle_time.rb
                          lib/cloudinary_subtitles_embedder/version.rb
                         ]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end

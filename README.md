# CloudinarySubtitlesEmbedder
This gem is used in order to take a video that is hosted on cloudinary and subtitles, and give back a link to video with subtitles embedded in it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloudinary_subtitles_embedder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudinary_subtitles_embedder

## Usage

This gem is exposing a simple API:
CloudinarySubtitlesEmbedder.addSubtitlesToVideo(videoPublicId, subtitles, cloud_name)
Where

videoPublicId - the name of the video + file type.

subtitles - json object of this format: http://res.cloudinary.com/candidate-evaluation/raw/upload/v1545227339/thepresent_-_subtitles.txt .

cloud_name - the cloud_name in cloudinary.com - the default is candidate-evaluation.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cloudinary_subtitles_embedder.


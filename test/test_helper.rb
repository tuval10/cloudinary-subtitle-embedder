$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'cloudinary_subtitles_embedder'
require 'minitest/autorun'
require 'json'

class Minitest::Test
  # Add more helper methods to be used by all tests here...
  def assert_raise_with_message(e, message, &block)
    e = assert_raises(e, &block)
    if message.is_a?(Regexp)
      assert_match(message, e.message)
    else
      assert_equal(message, e.message)
    end
  end

  @subtitles

  def self.subtitles
    unless defined? @subtitles
      file = File.read(Dir.pwd + '/test/assets/thepresent_-_subtitles.json')
      @subtitles = JSON.parse(file)['subtitles']
    end
    @subtitles
  end
end

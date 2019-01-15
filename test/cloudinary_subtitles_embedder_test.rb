require 'test_helper'
require 'minitest/autorun'

class CloudinarySubtitlesEmbedderTest < Minitest::Test
  attr_accessor :subtitles_obj

  def expected_url
    "https://res.cloudinary.com/candidate-evaluation/video/upload/"\
"l_text:Roboto_34px_bold:Hey%20Sweetie%21%20Sorry%20I%20got%20home%20so%20late...,so_24.8,eo_27.2,co_white,g_south,y_20/"\
"l_text:Roboto_34px_bold:but%20I%20had%20to%20pick%20something%20up%20after%20work.,so_27.2,eo_30.6,co_white,g_south,y_20/"\
"l_text:Roboto_34px_bold:It%27s%20such%20a%20beautiful%20day%20outside%252C%20you%20should%20let%20some%20sun%20inside.,so_30.6,eo_34.4,co_white,g_south,y_20/"\
"l_text:Roboto_34px_bold:Why%20don%27t%20you%20stop%20playing%20and%20open%20your%20present%3F,so_39.4,eo_42.5,co_white,g_south,y_20/"\
"l_text:Roboto_34px_bold:For%20me%3F,so_43.1,eo_44.8,co_white,g_south,y_20/"\
"l_text:Roboto_34px_bold:Yes%20Sir%252C%20I%20don%27t%20know%20why%20you%20didn%27t%20get%20the%20papers.,so_46.2,eo_49.6,co_white,g_south,y_20/"\
"l_text:Roboto_34px_bold:Woah%21%20Cool%21,so_55.7,eo_57.7,co_white,g_south,y_20/"\
"l_text:Roboto_34px_bold:She%27s%20gotta%20be%20kidding%20me%21,so_68.1,eo_70.4,co_white,g_south,y_20/"\
"l_text:Roboto_34px_bold:GET%20LOST%21%3F,so_77.5,eo_79.3,co_white,g_south,y_20/"\
"l_text:Roboto_34px_bold:MUM%21%20WE%27LL%20BE%20OUTSIDE%21,so_184.7,eo_187.3,co_white,g_south,y_20/"\
"The_Present.mp4"
  end

  def expected_url_with_display_options
    expected_url.gsub('y_20', 'y_30')
  end

  def test_that_it_has_a_version_number
    refute_nil ::CloudinarySubtitlesEmbedder::VERSION
  end

  def test_add_subtitles_to_video
    public_id = 'The_Present.mp4'
    result = CloudinarySubtitlesEmbedder.add_subtitles_to_video(
      public_id,
      { "subtitles" => self.class.subtitles }
    )
    assert_equal expected_url, result
  end

  def test_add_subtitles_to_video_handle_no_subtitles
    public_id = 'The_Present.mp4'
    expected_url = 'https://res.cloudinary.com/candidate-evaluation/video/upload/The_Present.mp4'
    result = CloudinarySubtitlesEmbedder.add_subtitles_to_video(
      public_id,
      { "subtitles" => [] },
      'candidate-evaluation'
    )
    assert_equal expected_url, result
  end

  def test_add_subtitles_to_video_with_display_options
    public_id = 'The_Present.mp4'
    display_options = %w(co_white g_south y_30)
    result = CloudinarySubtitlesEmbedder.add_subtitles_to_video(
      public_id,
      { "subtitles" => self.class.subtitles },
      'candidate-evaluation',
      display_options
    )
    assert_equal expected_url_with_display_options, result
  end
end

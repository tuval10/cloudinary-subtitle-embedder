require 'test_helper'
require 'minitest/autorun'

class CloudinarySubtitlesEmbedderTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CloudinarySubtitlesEmbedder::VERSION
  end

  def test_addSubtitlesToVideo
    public_id = 'The_Present.mp4'
    result = CloudinarySubtitlesEmbedder.addSubtitlesToVideo(public_id, self.class.subtitles)
    expected = 'https://res.cloudinary.com/candidate-evaluation/video/upload/l_text:Roboto_34px_bold:Hey%20Sweetie%21%20Sorry%20I%20got%20home%20so%20late...,so_24.8,eo_27.2,co_white,g_south,y_20/l_text:Roboto_34px_bold:but%20I%20had%20to%20pick%20something%20up%20after%20work.,so_27.2,eo_30.6,co_white,g_south,y_20/l_text:Roboto_34px_bold:It%27s%20such%20a%20beautiful%20day%20outside%252C%20you%20should%20let%20some%20sun%20inside.,so_30.6,eo_34.4,co_white,g_south,y_20/l_text:Roboto_34px_bold:Why%20don%27t%20you%20stop%20playing%20and%20open%20your%20present%3F,so_39.4,eo_42.5,co_white,g_south,y_20/l_text:Roboto_34px_bold:For%20me%3F,so_43.1,eo_44.8,co_white,g_south,y_20/l_text:Roboto_34px_bold:Yes%20Sir%252C%20I%20don%27t%20know%20why%20you%20didn%27t%20get%20the%20papers.,so_46.2,eo_49.6,co_white,g_south,y_20/l_text:Roboto_34px_bold:Woah%21%20Cool%21,so_55.7,eo_57.7,co_white,g_south,y_20/l_text:Roboto_34px_bold:She%27s%20gotta%20be%20kidding%20me%21,so_68.1,eo_70.4,co_white,g_south,y_20/l_text:Roboto_34px_bold:GET%20LOST%21%3F,so_77.5,eo_79.3,co_white,g_south,y_20/l_text:Roboto_34px_bold:MUM%21%20WE%27LL%20BE%20OUTSIDE%21,so_184.7,eo_187.3,co_white,g_south,y_20/The_Present.mp4'
    assert_equal expected, result
  end
end

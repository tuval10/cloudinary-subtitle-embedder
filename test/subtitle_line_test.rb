class SubtitleLineTest < Minitest::Test

  def setup
    @line = SubtitleLine.new(self.class.subtitles[0])
  end

  def test_initialize
    @@options = 123
    expected_text = 'Hey Sweetie! Sorry I got home so late...'
    expected_display_options = %w(co_white g_south y_20)
    assert_equal '0:24.8', @line.start_time.to_s
    assert_equal '0:27.2', @line.end_time.to_s
    assert_equal expected_text, @line.text
    assert_equal expected_display_options, @line.display_options
  end

  def test_initialize_sets_display_options_if_provided
    expected_display_options = %w(co_white)
    @line = SubtitleLine.new(self.class.subtitles[0], expected_display_options)
    assert_equal expected_display_options, @line.display_options
  end

  def test_to_s
    expected_text_encoded = 'Hey%20Sweetie%21%20Sorry%20I%20got%20home%20so%20late...'
    expected = "/l_text:Roboto_34px_bold:#{expected_text_encoded},so_24.8,eo_27.2,co_white,g_south,y_20"
    assert_equal expected, @line.to_s
  end

  def test_to_s_handles_commas
    @line = SubtitleLine.new(self.class.subtitles[2])
    expected_text_encoded = "It%27s%20such%20a%20beautiful%20day%20outside%252C%20you%20should%20let%20some%20sun%20inside."
    expected = "/l_text:Roboto_34px_bold:#{expected_text_encoded},so_30.6,eo_34.4,co_white,g_south,y_20"
    assert_equal expected, @line.to_s
  end

end

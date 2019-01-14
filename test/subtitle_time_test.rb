class SubtitleTimeTest < Minitest::Test
  def valid_times
    %w[111:59:59.99 23:59.99 59.99 59 0.99 111:0:0.0 1:0.0 1.0 0.0 0 0:27.2]
  end

  def valid_times_in_seconds
    [403199.99, 1439.99, 59.99, 59, 0.99, 399600, 60, 1, 0, 0, 27.2]
  end

  def invalid_times
    %w[11:59:59.101 11:59:61.99 11:61:59.99 .99 :11:59:59.99 11:11:59:59.99
       12:d 12:111 :12:11 \ ]
  end

  def test_validate_duration_returns_true_to_well_formatted_strings
    valid_times.each do |time|
      CloudinarySubtitlesEmbedder::SubtitleTime.validate_duration_format(time)
    end
  end

  def test_validate_duration_returns_false_to_not_formatted_strings
    expected_message = 'time format supports only format hours:minutes:seconds.milliseconds'
    invalid_times.each do |invalid_time|
      assert_raise_with_message(ArgumentError, expected_message) do
        CloudinarySubtitlesEmbedder::SubtitleTime.validate_duration_format(invalid_time)
      end
    end
  end

  def test_to_seconds
    valid_times.zip(valid_times_in_seconds).each do |(time_string, expected_seconds)|
      result = CloudinarySubtitlesEmbedder::SubtitleTime.to_seconds(time_string)
      msg = "#{time_string} = #{expected_seconds} seconds"
      assert_equal expected_seconds, result, msg
    end
  end

end

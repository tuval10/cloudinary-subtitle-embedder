require 'erb'

class SubtitleLine
  attr_accessor :start_time, :end_time, :text

  def display_options
    @display_options || %w(co_white g_south y_20)
  end

  def self.font
    'Roboto_34px_bold'
  end

  def initialize(subtitle_options, general_display_options = nil)
    self.start_time = subtitle_options["start-timing"]
    self.end_time = subtitle_options["end-timing"]
    self.text = subtitle_options["text"]
    @display_options = general_display_options
  end

  def to_s
    display_options_string = display_options.join(',')
    # see https://support.cloudinary.com/hc/en-us/community/posts/200788162-Using-special-characters-in-Text-overlaying-
    escaped_text = ERB::Util.url_encode(text)
                     .gsub('%2C', '%252C')
    start_time_sec = SubtitleTime.to_seconds(start_time)
    end_time_sec = SubtitleTime.to_seconds(end_time)
    "/l_text:#{self.class.font}:#{escaped_text},so_#{start_time_sec},eo_#{end_time_sec}" +
      (display_options_string.empty? ? '' : ',') +
      display_options_string
  end
end
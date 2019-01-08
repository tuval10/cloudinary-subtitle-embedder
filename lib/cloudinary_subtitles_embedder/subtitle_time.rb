class SubtitleTime
  class << self
    def multipliers
      [1, 60, 3600]
    end

    def to_seconds(duration_string)
      validate_duration_format(duration_string)
      time_parts = duration_string.split('.')[0].split(':')
      seconds = time_parts
                  .reverse.map(&:to_i)
                  .zip(multipliers[0..time_parts.length])
                  .map {|(time_part, seconds_multiplier)| time_part * seconds_multiplier}
                  .reduce(&:+)
      return seconds unless duration_string.include? '.'
      milliseconds = duration_string.split('.')[-1]
      "#{seconds}.#{milliseconds}".to_f
    end

    def validate_duration_format(duration_string)
      valid = duration_string =~ /^([0-9]+:)?([0-5]?[0-9]:)?([0-5]?[0-9])(\.[0-9]?[0-9])?$/
      exception = ArgumentError.new('time format supports only format hours:minutes:seconds.milliseconds')
      raise exception unless valid
    end
  end
end

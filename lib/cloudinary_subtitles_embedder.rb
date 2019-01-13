require 'cloudinary_subtitles_embedder/version'

module CloudinarySubtitlesEmbedder
  def self.add_subtitles_to_video(
    video_public_id,
    subtitles,
    cloud_name = 'candidate-evaluation',
    display_options = nil
  )
    to_sub = Proc.new do |s|
      SubtitleLine.new(s, display_options)
    end
    prefix = "https://res.cloudinary.com/#{cloud_name}/video/upload"
    subtitle_url = subtitles
                     .map{|s| to_sub.call(s)}
                     .map(&:to_s)
                     .reduce(&:+)
    prefix + subtitle_url + '/' + video_public_id
  end

  require 'cloudinary_subtitles_embedder/subtitle_time'
  require 'cloudinary_subtitles_embedder/subtitle_line'
end

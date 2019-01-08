require 'cloudinary_subtitles_embedder/version'

module CloudinarySubtitlesEmbedder
  def self.addSubtitlesToVideo(videoPublicId, subtitles)
    prefix = 'https://res.cloudinary.com/candidate-evaluation/video/upload'
    subtitle_url = subtitles
                     .map{|s| SubtitleLine.new(s)}
                     .map(&:to_s)
                     .reduce(&:+)
    prefix + subtitle_url + '/' + videoPublicId
  end

  require 'cloudinary_subtitles_embedder/subtitle_time'
  require 'cloudinary_subtitles_embedder/subtitle_line'
end

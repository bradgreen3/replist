require 'rails-html-sanitizer'

class YoutubeComments

  def self.all(id)
    comments = YoutubeService.get_comments(id)
    full_sanitizer = Rails::Html::FullSanitizer.new
    comments = comments.map do |comment|
      full_sanitizer.sanitize(comment)
    end
  end

end

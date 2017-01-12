require 'rails-html-sanitizer'

class YoutubeComments

  def self.all(id)
    comments = YoutubeService.new(id, nil).get_comments
    full_sanitizer = Rails::Html::FullSanitizer.new
    comments = comments.map do |comment|
      full_sanitizer.sanitize(comment)
    end
  end

end

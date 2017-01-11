class YoutubeCommentsController < ApplicationController

  def index
    @id = params[:id]
    @comments = YoutubeComments.all(@id)
  end

end

class Youtube::CommentsController < ApplicationController

  def index
    @id = params[:id]
    @comments = YoutubeComments.all(@id)
  end

end

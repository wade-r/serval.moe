class CommentsController < ApplicationController
  layout false

  def index
    @page_size = 100
    @comments = Comment.all.order("id DESC").limit(@page_size)
    if last_id.present?
      @comments = @comments.where("id < ?", last_id)
    end
    @comments = @comments.reverse
  end

  def create
    @comment = Comment.create params.require(:comment).permit(:content).merge({ visitor_id: visitor_id })
  end

  protected

  def last_id
    params[:last_id]
  end

  def visitor_id
    @visitor_id ||= session[:visitor_id]
  end

end


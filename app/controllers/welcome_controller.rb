class WelcomeController < ApplicationController
  def index
    upgrade_session

    if visitor_id.present?
      @visitors_count = Redis.current.get "visitor_count"
    else
      @visitors_count = Redis.current.incr "visitor_count"
      self.visitor_id = @visitors_count
    end

    @comments_count = Comment.all.count
    @comment = Comment.new
  end

  private

  def visitor_id
    @visitor_id ||= session[:visitor_id]
  end

  def visitor_id=(id)
    @visitor_id = id.to_s
    session[:visitor_id] = id.to_s
  end

  def upgrade_session
    session.delete :visited
  end
end

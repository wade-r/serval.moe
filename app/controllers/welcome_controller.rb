class WelcomeController < ApplicationController
  def index
    @new_comment = Comment.new
    @visitors_count = Redis.current.incr "visitor_count"
  end
end

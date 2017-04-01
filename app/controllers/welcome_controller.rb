class WelcomeController < ApplicationController
  def index
    redis_key = "visitor_count"
    if session[:visited]
      @visitors_count = Redis.current.get redis_key
    else
      @visitors_count = Redis.current.incr redis_key
      session[:visited] = "1"
    end
    @new_comment = Comment.new
  end
end

class WelcomeController < ApplicationController
  def index
    @visitors_count = Redis.current.incr "visitor_count"
  end
end

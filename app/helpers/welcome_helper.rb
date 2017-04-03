module WelcomeHelper
  def color_from_visitor_id(id)
    colors = %w(#1abc9c #2ecc71 #3498db #9b59b6 #34495e #f1c40f #e67e22 #e74c3c)
    colors[id.to_i % colors.count]
  end
end

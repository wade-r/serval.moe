if @comment.errors.count > 0
  json.error @comment.errors.full_messages.join(',')
else
  json.comment do
    json.partial! 'show', comment: @comment
  end
  json.total_count Comment.all.count
end

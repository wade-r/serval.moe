json.comments @comments do |c|
  json.partial! 'show', comment: c
end

json.total_count Comment.all.count
json.page_size @page_size

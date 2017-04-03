renderComment = (c) ->
  '<span style="color:' + c.visitor_color + ';">FRIENDs#' + c.visitor_id + '</span> ' + '<small>' + c.created_at + '</small>' + '<p class="text-primary">' + c.content + '</p>'

onComments = (data, fresh) ->
  # remove load-more if existed
  $("#load-more").remove()
  ele = $("#comments")
  # clear if fresh
  if fresh
    ele.html ""
  # append
  html = ""
  for c in data.comments
    html = html + renderComment(c)
  ele.prepend html
  # add load-more
  if data.comments.length == data.page_size
    ele.prepend '<p id="load-more" data-last-id="' + data.comments[0].id + '"> Load More </p>'
    setTimeout ->
      $("#load-more").click (e)->
        $(e.target).text "Loading"
        $(e.target).click ->
        $.get "/comments.json", { last_id: $(e.target).attr 'data-last-id' }, (data)->
          onComments data, false
    , 100
  # scroll
  if fresh
    ele.scrollTop ele[0].scrollHeight
  else
    ele.scrollTop 0
  # update total_count
  $("#total-count").text data.total_count

$(document).on "turbolinks:load", ->
  $("#button-chat").click ->
    $("#chat-box").fadeIn(200)
    $.get "/comments.json", (data) ->
      onComments data, true
  $("#button-close").click ->
    $("#chat-box").fadeOut(200)
  $("#button-send").click ->
    $("form#new_comment").submit()
  $("form#new_comment").on 'ajax:success', (e, data, status) ->
    ele = $("#comments")
    if data.error
      ele.append '<p class="text-danger">' + data.error + "</p>"
    else
      ele.append renderComment data.comment
      $("#total-count").text data.total_count
    ele.scrollTop ele[0].scrollHeight
    $("textarea#input-content").val ""

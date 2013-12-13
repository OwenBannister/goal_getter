# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#new_task").on("ajax:success", (e, data, status, xhr) ->
    $("#new_task").append xhr.responseText
    ).bind "ajax:error", (e, xhr, status, error) ->
    $("#new_task").append "<p>ERROR</p>"


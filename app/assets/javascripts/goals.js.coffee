# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
    $(document).ready ->
      $("#new_task_goal").on("ajax:success", (e, data, status, xhr) ->
        alert("hello world")
        $("#new_task_goal").append xhr.responseText;
        ).bind "ajax:error", (e, xhr, status, error) ->
        alert("error")
        $("#new_task_goal").append "<p>ERROR</p>"

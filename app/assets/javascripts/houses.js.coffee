# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("button#show_description").click ->
    $("div#description").toggle()
  $("button#show_residential_apartments").click ->
    $("div#residential_apartments").toggle()
  $("button#show_not_residential_apartments").click ->
    $("div#not_residential_apartments").toggle()

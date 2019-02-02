# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#datetimepicker').datetimepicker
    format:'Y/m/d H:i',
    inline:true,
    step: 1,
    lang: 'ja',
    onSelectTime: () ->
      $('#schedule_start_date_time').val $('#datetimepicker').val()
    onSelectDate: () ->
      $('#schedule_start_date_time').val $('#datetimepicker').val()
      $.ajax
        url: 'schedules/update'
        type: 'PUT'
        data: { start_date_time: $('#datetimepicker').val() }
        success: (data) ->
          return
        error: (xhr, satus, err) ->
          return

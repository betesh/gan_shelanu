form = -> $('form#new_contact')
submit_contact_us = ->
  xhr = $.ajax
    url: '/contact_us'
    type: 'POST'
    data: form().serialize()
  xhr.done -> xhr.responseText
  xhr.fail -> alert xhr.statusText+"\nResponse:\n"+xhr.responseText
set_ajax_submit = ->
  $('input#contact_us_submit').click ->
    submit_contact_us()
    false
$ ->
  set_ajax_submit()

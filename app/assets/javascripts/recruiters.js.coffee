# app/assets/javascripts/recruiters.js.coffee

$ ->
  $form = $('#sort-recruiters')
  return if 0 == $form.count

  $form.find('select').bind 'change', ->
    $form.submit()

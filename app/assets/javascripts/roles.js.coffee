# app/assets/javascripts/roles.js.coffee

$ ->
  $form = $('#sort-roles')
  return if 0 == $form.count

  $form.find('select').bind 'change', ->
    $form.submit()

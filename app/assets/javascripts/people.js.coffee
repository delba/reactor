source = new EventSource('/events')

source.addEventListener 'message', (e) ->
  person = JSON.parse(e.data)
  $person = $("#person_#{person.id}")
  for key, value of person when key isnt 'id' or 'updated_at'
    $person.find(".#{key}").text value

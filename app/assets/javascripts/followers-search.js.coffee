$(document).ready ->
  substringMatcher = (strs) ->
    findMatches = (q, cb) ->
      matches = []
      substrRegex = new RegExp(q, "i")
      $.each strs, (i, str) ->
        matches.push value: str  if substrRegex.test(str)
      cb matches

  users = $("#follow-autocomplete").data("autocomplete")

  $(".followers.typeahead").typeahead
    hint: true
    highlight: true
    minLength: 1
  ,
    name: "users"
    displayKey: "value"
    source: substringMatcher(users)

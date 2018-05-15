json.book do
  json.title @event.book.title
  json.cover @event.book.cover_url
end

json.owner do
  json.username @event.user.username
  json.contact @event.user.contact
  json.address @event.user.address
end

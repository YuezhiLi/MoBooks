json.book do
  json.title @book.title
  json.author @book.author
  json.summary @book.description
  json.owner @book.user
  json.cover @book.cover_url
  json.id @book.id
end

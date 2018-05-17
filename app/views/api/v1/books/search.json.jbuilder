json.books do
  json.array! @books do |book|
    json.id book.id
    json.author book.author
    json.cover book.cover_url
    json.title book.title
  end
end

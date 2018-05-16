json.books do
  json.array! @books do |book|
    json.cover book.cover_url
    json.title book.title
  end
end

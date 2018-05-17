json.my_books do
  json.array! @my_books do |book|
    json.id book.id
    json.title book.title
    json.available? book.available
    json.event book.events.last
  end
end

json.my_reading_list do
  json.array! @my_reading_list do |book|
    json.id book.id
    json.title book.title
    json.event book.events.last
  end
end

json.my_read_list do
  json.array! @my_read_list do |book|
    json.id book.id
    json.title book.title
  end
end

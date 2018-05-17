json.review do
  json.id @review.id
  json.book @review.event.book
  json.rating @review.rating
  json.content @review.content
end

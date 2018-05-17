json.review do
  json.id @review.id
  json.book @review.book
  json.rating @review.rating
  json.content @review.content
end

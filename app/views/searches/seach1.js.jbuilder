json.array! @itemls do |product|
  json.id item.id
  json.title item.name
  json.image item.price
  json.detail item.image
end

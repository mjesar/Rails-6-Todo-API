json.current @todos.current_page
json.per_page @todos.limit_value
json.pages @todos.total_pages
json.count @todos.total_count
json.sys do
  json.type 'Array'
end

json.items do
  json.array! @todos do |todo|
    json.partial! 'api/v1/todos/todo', todo: todo
  end
end

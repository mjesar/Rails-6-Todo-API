json.sys do
  json.type 'Array'
end

json.items do
  json.array! @todos do |todo|
    json.partial! 'api/v1/todos/todo', todo: todo
  end
end

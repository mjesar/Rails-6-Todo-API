json.sys do
  json.id todo.id
  json.type todo.class.name
  json.created_at todo.created_at
  json.updated_at todo.updated_at
end

json.extract! todo, :title, :description, :status

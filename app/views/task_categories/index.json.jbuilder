json.array!(@task_categories) do |task_category|
  json.extract! task_category, :id
  json.url task_category_url(task_category, format: :json)
end

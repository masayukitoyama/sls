unless TaskCategory.find_by(id: 1)
  TaskCategory.create(
    task_category_title: "タイトル1"
  )
end
unless TaskCategory.find_by(id: 2)
  TaskCategory.create(
    task_category_title: "タイトル2"
  )
end
unless TaskCategory.find_by(id: 3)
  TaskCategory.create(
    task_category_title: "タイトル3"
  )
end

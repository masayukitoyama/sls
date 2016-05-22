unless Task.find_by(id: 1)
  Task.create(
    task_category_id: 1,
    task_title: "課題1",
    task_content: "タスク",
    task_example: "タスクの例"
  )
end
unless Task.find_by(id: 2)
  Task.create(
    task_category_id: 2,
    task_title: "課題2",
    task_content: "タスクタスク",
    task_example: "タスクタスクの例"
  )
end
unless Task.find_by(id: 3)
  Task.create(
    task_category_id: 2,
    task_title: "課題3",
    task_content: "タスクタスクタスク",
    task_example: "タスクタスクタスクの例"
  )
end

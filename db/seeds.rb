# 開発用テストデータ
if Rails.env == 'development'
  load(Rails.root.join( 'db', 'seeds', 'task_categories_seeder.rb'))
  load(Rails.root.join( 'db', 'seeds', 'tasks_seeder.rb'))
end
load(Rails.root.join( 'db', 'seeds', 'roles_seeder.rb'))

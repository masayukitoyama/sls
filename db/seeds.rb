# 開発用テストデータ
if Rails.env == 'development'
  load(Rails.root.join( 'db', 'seeds', 'users_seeder.rb'))
end

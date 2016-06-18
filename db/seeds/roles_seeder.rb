unless Role.find_by(id: 1)
  Role.create(
      role_name: "管理者権限" # 管理者
    )
end
unless Role.find_by(id: 2)
  Role.create(
      role_name: "リーダー権限" # 部屋作成可能
    )
end
unless Role.find_by(id: 3)
  Role.create(
      role_name: "閲覧権限" # 部屋の閲覧可能
    )
end
unless Role.find_by(id: 4)
  Role.create(
      role_name: "通常権限" # 通常ユーザー
    )
end

unless Belonging.find_by(id: 1)
  Belonging.create(
    belonging_name: "A事業部"
  )
end
unless Belonging.find_by(id: 2)
  Belonging.create(
    belonging_name: "B事業部"
  )
end
unless Belonging.find_by(id: 3)
  Belonging.create(
    belonging_name: "C事業部"
  )
end

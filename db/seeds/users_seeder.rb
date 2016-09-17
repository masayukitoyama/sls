unless User.find_by(id: 1)
  User.create(
    email: "masayuki.toyama@seattleconsulting.co.jp",
    password: "11111111",
    user_name: "遠山　将之"
  )
end

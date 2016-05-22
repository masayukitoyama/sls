unless User.find_by(id: 1)
  User.create(
    email: "masayuki.toyama@seattleconsulting.co.jp",
    password: "11111111",
    user_name: "遠山　将之",
    role_id: 1,
    job_type: 1,
    belonging_id: 1,
    user_memo: "2015年新卒未経験エンジニア"
  )
end

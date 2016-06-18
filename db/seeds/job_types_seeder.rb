unless JobType.find_by(id: 1)
  JobType.create(
    job_type_name: "エンジニア"
  )
end
unless JobType.find_by(id: 2)
  JobType.create(
    job_type_name: "営業"
  )
end
unless JobType.find_by(id: 3)
  JobType.create(
    job_type_name: "人事"
  )
end
unless JobType.find_by(id: 4)
  JobType.create(
    job_type_name: "労務"
  )
end
unless JobType.find_by(id: 5)
  JobType.create(
    job_type_name: "マネジャー"
  )
end

module UsersHelper

  def job_types_options
    JobType.all.inject(Array.new) do |options, job_type|
      options << job_type
    end
  end

  def belongings_options
    Belonging.all.inject(Array.new) do |options, belonging|
      options << belonging
    end
  end
end

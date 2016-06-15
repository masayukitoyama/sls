module UsersHelper

  def job_types_options
    JobType.all.inject(Array.new) do |options, job_type|
      options << job_type
    end
  end
end

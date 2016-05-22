module TasksHelper

  def task_categories_options
    TaskCategory.all.inject(Array.new) do |options, task|
      options << task
    end
  end
end

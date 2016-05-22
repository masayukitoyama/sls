require 'rails_helper'

RSpec.describe "task_categories/show", type: :view do
  before(:each) do
    @task_category = assign(:task_category, TaskCategory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

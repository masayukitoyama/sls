require 'rails_helper'

RSpec.describe "task_categories/edit", type: :view do
  before(:each) do
    @task_category = assign(:task_category, TaskCategory.create!())
  end

  it "renders the edit task_category form" do
    render

    assert_select "form[action=?][method=?]", task_category_path(@task_category), "post" do
    end
  end
end

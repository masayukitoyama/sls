require 'rails_helper'

RSpec.describe "task_categories/index", type: :view do
  before(:each) do
    assign(:task_categories, [
      TaskCategory.create!(),
      TaskCategory.create!()
    ])
  end

  it "renders a list of task_categories" do
    render
  end
end

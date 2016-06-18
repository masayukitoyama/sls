class EmployeesController < ApplicationController

  def index
    @employees = User.get_employees
    @employee_menu = MENU_ACTIVE
  end

  def search
    @employees = get_by_search_params(params)
    render :index
  end


  private
    def get_by_search_params(params)
      return User.get_employees_by_search_params(params)
    end
end

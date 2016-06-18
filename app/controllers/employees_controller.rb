class EmployeesController < ApplicationController

  def index
    @employees = get_by_search_params(params)
    @employee_menu = MENU_ACTIVE
  end


  private
    def get_by_search_params(params)
      User.get_employees_by_search_params(params)
    end
end

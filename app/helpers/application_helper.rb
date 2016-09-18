module ApplicationHelper

  def jp_date(datetime)
    datetime.strftime('%Y-%m-%d')
  end

  def calc_date(return_day_type)
    today = Date.today
    case return_day_type
    when RETURN_DAYS[0][:id]
      today + 7.days
    when RETURN_DAYS[1][:id]
      today + 14.days
    when RETURN_DAYS[2][:id]
      today + 1.month
    end
  end

end

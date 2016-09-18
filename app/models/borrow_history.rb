class BorrowHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def self.get_all_order_limit_date_asc
    self.all.order(return_limit_date: :asc)
  end
end

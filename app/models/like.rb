class Like < ActiveRecord::Base

  acts_as_paranoid
  belongs_to :user
  belongs_to :book

  scope :join_book, -> { joins(:book) }
  scope :join_user, -> { joins(:user) }
  scope :where_user_id, -> (user_id) { where(user_id: user_id) }
  scope :where_book_id, -> (book_id) { where(book_id: book_id) }

  def self.get_count_by_book_id(book_id)
    self.where_book_id(book_id).count()
  end


end

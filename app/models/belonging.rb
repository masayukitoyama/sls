class Belonging < ActiveRecord::Base
  has_many :users

  acts_as_paranoid
end

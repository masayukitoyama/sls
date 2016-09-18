module AuthorityTypeFilter
  extend ActiveSupport::Concern

  def viewable_book_new?(user)
    if user.admin? || user.view?
      return true
    end
    false
  end

  def exectable_book_create?(user)
    if user.admin?
      return true
    end
    false
  end

  def exectable_book_update?(user)
    if user.admin?
      return true
    end
    false
  end

  def viewable_borrow_history?(user)
    if user.admin? || user.view?
      return true
    end
    false
  end

  def exectable_borrow_history_update?(user)
    if user.admin?
      return true
    end
    false
  end

  def exectable_user_create?(user)
    if user.admin?
      return true
    end
    false
  end

  def exectable_user_update?(user)
    if user.admin?
      return true
    end
    false
  end

end

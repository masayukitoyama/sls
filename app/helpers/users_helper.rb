module UsersHelper

  def set_authority_type(authority_type_value)
    AUTHORITY_TYPE.each do |authority_type|
      # binding.pry
      if authority_type[:value] == authority_type_value
        return authority_type[:label]
      end
    end
  end
end

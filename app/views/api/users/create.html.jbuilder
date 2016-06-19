json.status "success"
json.data do
  json.user do
    json.extract! @user,
      :id,
      :name,
      :email
  end
end
if @user.errors.any?
  json.status "error"
  json.data do
    json.errors do
      json.array! @user.errors.messages.keys do |key|
        json.key key
        json.message I18n.t('activerecord.attributes.user.' + key.to_s) + @user.errors.messages[key][0]
      end
    end
  end
end

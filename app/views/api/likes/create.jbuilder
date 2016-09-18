if @like.errors
  json.status "success"
  json.data do
    json.user do
      json.extract! @like,
        :id,
        :user_id,
        :book_id
    end
    json.total_likes @total_likes
  end
else
  json.status "error"
  json.data do
    json.errors do
      json.array! @like.errors.messages.keys do |key|
        json.key key
        json.message "error"
      end
    end
  end
end

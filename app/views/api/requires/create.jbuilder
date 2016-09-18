if @require.errors
  json.status "success"
  json.data do
    json.user do
      json.extract! @require,
        :id,
        :user_id,
        :asin,
        :title,
        :author,
        :lowest_new_price,
        :lowest_used_price,
        :image_url,
        :detail_page_url
    end
    json.total_requires @total_requires
  end
else
  json.status "error"
  json.data do
    json.errors do
      json.array! @require.errors.messages.keys do |key|
        json.key key
        json.message "error"
      end
    end
  end
end

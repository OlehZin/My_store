json.extract! faq, :id, :title, :description, :created_at, :updated_at
json.url faq_url(faq, format: :json)

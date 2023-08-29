json.extract! expense, :id, :day, :amount, :need, :date, :description, :created_at, :updated_at
json.url expense_url(expense, format: :json)

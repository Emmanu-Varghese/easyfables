json.extract! contest, :id, :title, :content, :prize_money, :start_date, :end_date, :rule_id, :category_id, :deleted, :created_at, :updated_at
json.url contest_url(contest, format: :json)

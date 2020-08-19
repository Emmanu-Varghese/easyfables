json.extract! story, :id, :tittle, :written_by, :intro, :content, :contest_id, :deleted, :created_at, :updated_at
json.url story_url(story, format: :json)

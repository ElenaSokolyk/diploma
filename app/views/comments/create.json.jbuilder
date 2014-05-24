json.(@comment, :id, :text, :commentable_type, :commentable_id)
json.created_at @comment.created_at.to_s
json.siblings_count @comment.siblings_count
json.user do
  json.email @comment.user.email
end
json.(@metrics) do |metric|
  json.value metric.value
  json.date metric.created_at.utc
end

def time_ago(created_at)
  seconds_ago = (Time.now - created_at).to_i
  return "#{seconds_ago} seconds" if seconds_ago <= 60
  return "#{seconds_ago / 60} minutes" if seconds_ago > 60
  return "#{seconds_ago / 60*60} hours" if seconds_ago > 60*60
  return "#{seconds_ago / 60*60*24} days" if seconds_ago > 60*60*24
end

if Rails.env.development?
  REDIS = Redis.new(host: "localhost", port: 6379)
else
  REDIS = nil;
end
if Rails.env.production?
  OmniAuth.config.full_host = "http://kapow.herokuapp.com"
else
  OmniAuth.config.full_host = "http://127.0.0.1:3000"
end
 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']  
end

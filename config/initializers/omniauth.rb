Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '292576830760282', '98b9738e614e2653511f4813464d7b9a'
end
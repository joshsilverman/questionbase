Rails.application.config.middleware.use OmniAuth::Builder do
  #LOCALHOST
  # provider :facebook, '267962299906639', 'efcf1dbdcc586b27dc8bb2a1320aa523'
  
  #PRODUCTION
  provider :facebook, '292576830760282', '98b9738e614e2653511f4813464d7b9a'
end
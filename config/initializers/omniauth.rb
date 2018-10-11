if config = Bound.config.auth
  Rails.application.config.middleware.use OmniAuth::Builder do
    # GitHub oAuth
    provider :github,  Bound.config.auth.client_key, Bound.config.auth.client_secret
  end
end

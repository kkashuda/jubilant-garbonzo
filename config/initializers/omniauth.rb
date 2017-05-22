OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1824722077856806', 'bfc55638dbe5bfad960d0c728690f2ab'
end
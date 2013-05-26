OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    provider: 'twitter',
    uid: '12345678',
    info:  {
      nickname: 'twiiter_user'
    },
    credentials: {
      secret: 'secretsecretsecretsecret',
      token: 'tokentokentokentokentoken',
    }
 })


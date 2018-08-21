Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
end
def self.create_with_auth_and_hash(authentication, auth_hash)
  user = self.create!(
    name: auth_hash["info"]["name"],
    email: auth_hash["info"]["email"],
    password: SecureRandom.hex(10)
  )
  user.authentications << authentication
  return user
end
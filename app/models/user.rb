# In app/models/user.rb    
class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, dependent: :destroy
 
  has_many :rooms
  has_many :reservations
  
  mount_uploader :avatar, AvatarUploader

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      first_name: auth_hash["info"]["first_name"],
      last_name: auth_hash["info"]["last_name"],
      birthdate: Date.new,
      # name: auth_hash["info"]["name"],
      email: auth_hash["info"]["email"],
      
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    return user
  end
 
  # grab google to access google for user data
  def google_token
    x = self.authentications.find_by(provider: 'google_oauth2')
    return x.token unless x.nil?
  end

  def fullname
    "#{first_name} #{last_name}"
  end
 end
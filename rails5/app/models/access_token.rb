class AccessToken < ApplicationRecord

  def self.create(user_id)
    access_token = AccessToken.new
    access_token.token = SecureRandom.urlsafe_base64(64)
    access_token.user_id = user_id
    access_token
  end

  def expired?
    expired_at < created_at
  end

  private

  def expired_at
    created_at + 30.day
  end

end

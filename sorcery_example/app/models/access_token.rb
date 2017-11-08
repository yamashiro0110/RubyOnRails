class AccessToken
  include Redis::Objects

  value :user_id

  def id
    SecureRandom.urlsafe_base64(64)
  end

end

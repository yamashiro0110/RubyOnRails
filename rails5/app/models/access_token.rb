class AccessToken
  include ActiveModel::Serializers
  include ActiveModel::AttributeAssignment

  attr_accessor :token, :user_id, :last_access, :created

  def self.create(token, user_id)
    now = Time.new
    prototype = AccessToken.new
    prototype.assign_attributes(token: token, user_id: user_id, created: now, last_access: now)
    prototype
  end

  def self.find(token)
    key = "rails:sample:token:#{token}"
    saved_json = Redis.current.get(key)
    return nil if saved_json == nil

    json = ActiveSupport::JSON.decode saved_json
    access_token = AccessToken.new
    access_token.assign_attributes(json)
    access_token
  end

  def exists?
    !token.empty?
  end

  def save!
    save_access_token!
    save_access_token_by_user_id!
  end

  def update_last_access!
    save_access_token!
  end

  def expired?
    createt_at = Time.parse(@created)
    expired_at = createt_at + 30.day
    now = Time.new
    now > expired_at
  end

  private

  def get(token)
    Redis.current.get(token)
  end

  def save_access_token!
    @last_access = Time.new
    key = "rails:sample:token:#{@token}"
    Redis.current.set(key, self.to_json)
  end

  def save_access_token_by_user_id!
    key = "rails:sample:user:#{@user_id}"
    tokens_by_user_id = Redis.current.get(key)

    if tokens_by_user_id == nil
      value = [@user_id].to_json
      Redis.current.set(key, value)
      return 'OK'
    end

    tokens = ActiveSupport::JSON.decode tokens_by_user_id
    return 'OK' if tokens.include? @token

    tokens.push(@token)
    Redis.current.set(key, tokens.to_json)
  end

end

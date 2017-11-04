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
    saved_json = Redis.current.get(token)

    if saved_json == nil
      return nil
    end

    json = ActiveSupport::JSON.decode saved_json
    access_token = AccessToken.new
    access_token.assign_attributes(json)
    access_token
  end

  def exists?
    !token.empty?
  end

  def save!
    save_on_redis!
  end

  private

  def get(token)
    Redis.current.get(token)
  end

  def save_on_redis!
    Redis.current.set(@token, self.to_json)
  end

end

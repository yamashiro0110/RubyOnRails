class V1::LoginUser
  include ActiveModel::Validations
  attr_accessor :name, :email, :token
  validates :name, presence: true
  validates :email, presence: true
  validates :token, presence: true
end

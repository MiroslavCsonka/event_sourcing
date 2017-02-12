class Events::SignedUp
  include ActiveModel::Model

  attr_accessor :email, :password

  def initialize(attributes = {})
    @email = attributes[:email]
    @password = attributes[:password]
  end

  def to_h
    { email: email, password: password }
  end
end

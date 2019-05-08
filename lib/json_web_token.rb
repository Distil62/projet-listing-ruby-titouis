require 'jwt'

class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, "tagada")
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, "tagada")[0])
  rescue
    nil
  end

end
class Usuario < ActiveRecord::Base
  belongs_to :grupo

  attr_accessor :password

  def self.authenticate(login, password)
    user = Usuario.find_by_login(login)

    if user.nil?
      login_succeeded = false
    else
      login_succeeded = false
      expected_password = encrypted_password(password, user.salt_password)
      if user.hashed_password == expected_password
        login_succeeded = true
      end
    end
    login_succeeded
  end

### ###

def password
  @password
end

def password=(pwd)
  @password = pwd
  return if pwd.blank?
  create_new_salt
  self.hashed_password = Usuario.encrypted_password(self.password, self.salt_password)
end



private

def self.encrypted_password(password, salt)

  string_to_hash = password + "wibble" + salt
  Digest::SHA1.hexdigest(string_to_hash)
end

def create_new_salt
  self.salt_password = self.object_id.to_s + rand.to_s
end

end

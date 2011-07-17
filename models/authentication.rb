class Authentication
  def self.authorize(username, password)
    Configuration.users[username] == password
  end
end
class Employee
  attr_reader :username, :password

  def initialize(attributes = {})
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role] #manager or delivery guy
  end
  def manager?
    @role == "manager"
  end

end

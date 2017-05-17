require_relative "../models/employee"
require_relative "base_repository"

class EmployeeRepository < BaseRepository
  def find_by_username(username)
      @elements.find{|user| user.username == username}
  end
private
  def build_element(row)
    # id, username, password, role
    row[:id] = row[:id].to_i # Convert column to Fixnum
    Employee.new(row)
  end
end

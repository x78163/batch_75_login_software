require_relative "base_view"

class SessionsView < BaseView

  def wrong_credentials
    puts "Wrong credentials! Try it again!"
  end
  def sign_in_success
    puts "Welcome to the system!!!!"
    puts ""
  end
end


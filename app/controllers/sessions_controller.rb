require_relative "../views/sessions_view"

class SessionsController
  def initialize(repo)
    @repo = repo
    @view = SessionsView.new
  end
  def sign_in
    # Ask for username
     username = @view.ask_for("username")
    # Ask for password
     password = @view.ask_for("password")
    # Check if a employee if it exists
     user = @repo.find_by_username(username)
    # check if the pasword it's matching
    if user && user.password == password
      # show the greeting menu
      @view.sign_in_success
      user
    else
      print `clear`
      # show wrong credentials
      @view.wrong_credentials
      # ask again
      sign_in
    end
  end
end

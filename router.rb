class Router
  def initialize(meals_controller, customers_controller,sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @run = true
  end

  def run
    while @run
      @user = @sessions_controller.sign_in
      while @user
        if @user.manager?
          print_menu
          ####
          action = ask_action
          #####
          manage_action(action)
          ######
        else
          print_menu_delivery
          action = ask_action
          manage_action_delivery(action)
        end


      end
    end
  end

  private
  def manage_action(action)
    case action
      when 1 then @meals_controller.add
      when 2 then @meals_controller.list
      when 3 then @customers_controller.add
      when 4 then @customers_controller.list
      when 8 then @user = nil
      when 9
        @user = nil
        @run = false
      else
        puts 'Wrong action'
      end
  end
  def manage_action_delivery(action)
    case action
      when 1 then puts "TODO: LIST ALL MEALS"
      when 2 then puts "TODO: MARK MEAL AS DONE"
      else
        puts 'Wrong action'
      end
  end

  def ask_action
    puts 'What do you want to do next?'
      print '> '
      gets.chomp.to_i
  end
  def print_menu
    puts '1. Add a meal'
    puts '2. List available meals'
    puts '3. Add a customer'
    puts '4. List customers'
    puts '8. Sign out'
    puts '9. Exit'
  end
   def print_menu_delivery
    puts '1. List available meals'
    puts '2. Mark a meal as done'
  end
end

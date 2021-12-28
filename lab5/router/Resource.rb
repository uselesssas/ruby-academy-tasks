module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp.upcase
      break if verb == 'Q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp.downcase
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

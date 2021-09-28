module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = ['1 - post', '2 - post', '3 - post', '4 - post']
  end

  def index
    @posts.each_with_index do |post, index|
      puts "#{index}. #{post}"
    end
  end

  def show
    print 'Input post id: '
    index = gets.to_i
    if @posts[index].nil?
      puts 'Post not found'
    else
      puts "#{index}. #{@posts[index]}"
    end
  end

  def create
    print 'Enter the text of your post: '
    post = gets.chomp
    @posts.push(post)
    puts "#{@posts.size - 1}. #{post}"
  end

  def update
    print 'Enter the ID of the post to update: '
    index = gets.to_i
    if @posts[index].nil?
      puts 'Post not found'
    else
      print 'Enter the updated entry: '
      post = gets.chomp
      @posts[index] = post
      puts "#{index}. #{post}"
    end
  end

  def destroy
    print 'Enter the ID of the post to delete: '
    index = gets.to_i
    if @posts[index].nil?
      puts 'Post not found'
    else
      @posts.delete_at(index)
    end
  end
end

class CommentsController
  extend Resource

  def initialize
    @comments = ['1 - comment', '2 - comment', '3 - comment', '4 - comment']
  end

  def index
    @comments.each_with_index do |comment, index|
      puts "#{index}. #{comment}"
    end
  end

  def show
    print 'Input comment id: '
    index = gets.to_i
    if @comments[index].nil?
      puts 'Comment not found'
    else
      puts "#{index}. #{@comments[index]}"
    end
  end

  def create
    print 'Enter the text of your comment: '
    comment = gets.chomp
    @comments.push(comment)
    puts "#{@comments.size - 1}. #{comment}"
  end

  def update
    print 'Enter the ID of the comment to update: '
    index = gets.to_i
    if @comments[index].nil?
      puts 'Comment not found'
    else
      print 'Enter the updated comment: '
      comment = gets.chomp
      @comments[index] = post
      puts "#{index}. #{comment}"
    end
  end

  def destroy
    print 'Enter the ID of the comment to delete: '
    index = gets.to_i
    if @comments[index].nil?
      puts 'Comment not found'
    else
      @comments.delete_at(index)
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp
      case choise
      when '1' then PostsController.connection(@routes['posts'])
      when '2' then CommentsController.connection(@routes['comments'])
      end
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new
router.init

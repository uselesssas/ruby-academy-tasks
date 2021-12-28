require_relative 'Resource'

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    if @posts.empty?
      puts 'Posts not found'
    else
      @posts.each_with_index do |post, index|
        puts "#{index}. #{post}"
      end
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

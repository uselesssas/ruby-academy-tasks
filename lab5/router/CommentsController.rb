require_relative 'Resource'

class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    if @comments.empty?
      puts 'Comments not found'
    else
      @comments.each_with_index do |comment, index|
        puts "#{index}. #{comment}"
      end
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
      @comments[index] = comment
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

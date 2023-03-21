class LinkedList
attr_accessor :head, :tail

  def initialize
    head = nil
    tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if self.head == nil
      self.head = new_node
    else 
      self.tail.next_node = new_node if self.tail
    end
    self.tail = new_node
    puts "#{self.tail.value} successfully added to the end of the list"
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = self.head if self.head
    self.head = new_node
    puts "#{self.head.value} successfully added to the head of the list"
  end
end

class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

list = LinkedList.new

list.prepend(5)
list.append(8)

puts "#{list.head.value} is the head of the list and #{list.tail.value} is the tail of the list"



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
      self.tail.next_node = new_node
    end
    self.tail = new_node
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


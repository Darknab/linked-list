class LinkedList
attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if self.head == nil
      self.head = new_node
    else 
      self.tail.next_node = new_node if self.tail
    end
    self.tail = new_node
    self.size += 1
    puts "#{self.tail.value} successfully added to the end of the list"
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = self.head if self.head
    self.head = new_node
    self.size += 1
    puts "#{self.head.value} successfully added to the head of the list"
  end

  def at(index)
    puts "the list size is shorter than #{index}" if (index - 1) > self.size
    current = self.head
    index.times do
      current = current.next_node
    end
    puts "#{current.value} is the value at index #{index}"
  end

  def pop
    current = self.head
    second_last = self.size - 2
    second_last.times do
      current = current.next_node
    end
    current.next_node = nil
    self.tail = current
    puts "The last value was successfully removed"
  end 

  def contains?(value)
    current = head
    return true if current.value ==  value
    while current = current.next_node
      return true if current.value == value
    end
    return false
  end

  def find(value)
    current = head
    index = 0
    if current.value ==  value
      puts "Found at index 0" 
      return
    end
    while current = current.next_node
      index += 1
      if current.value == value
        puts "Found at index #{index}"
        return
      end
    end
    puts"Not found"
  end

  def to_s
    result = ""
    current  = head
    result += "(#{current.value}) -> " if head.value
    while current = current.next_node
      result += "(#{current.value}) -> "
    end
    result += "nil"
    puts result
  end

  def insert_at(value, index)
    if index > (self.size - 1)
      puts "index do not exist"
      return
    elsif index == 0
      self.prepend(value)
      return
    elsif index == (self.size - 1)
      self.append(value)
      return
    end
    new_node = Node.new(value)
    previous_node = self.node_at(index - 1)
    current_node = self.node_at(index)
    new_node.next_node = current_node
    previous_node.next_node = new_node
    self.size += 1
    puts "#{new_node.value} was successfully added at index #{index}"
  end

  def remove_at(index)
    if index > (self.size - 1)
      puts "index do not exist"
      return
    elsif index == (self.size - 1)
      self.pop
      return
    elsif index == 0
      current = self.head
      self.head = current.next_node
      self.size -= 1
      return
    end
    previous_node = self.node_at(index - 1)
    current_node = self.node_at(index + 1)
    previous_node.next_node = current_node
    self.size -= 1
    puts "Value was successfully removed from index #{index}"
  end

  private

  def node_at(index)
    current = self.head
    index.times do
      current = current.next_node
    end
    return current
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

list.append(8)
list.append(9)
list.append(12)
list.prepend(11)
list.prepend(15)


puts "#{list.head.value} is the head of the list and #{list.tail.value} is the tail of the list"
puts "size of the list is #{list.size}"

list.at(1)

list.pop

puts "#{list.head.value} is the head of the list and #{list.tail.value} is the tail of the list"

list.to_s

list.insert_at(7, 2)

list.to_s

list.remove_at(2)

list.to_s




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

puts "Please enter a value to add to the new list"
input = gets.chomp.to_i
list.append(input)

loop do
  puts "Please select an action to execute:"
  puts "* Type 1 to append a value to the end of the list"
  puts "* Type 2 to prepend a value to the start of the list"
  puts "* Type 3 to insert a value at a given index of the list"
  puts "* Type 4 to remove a value from a given index of the list"
  puts "* Type 5 to show the size of the list"
  puts "* Type 6 to show the value stored at a given index"
  puts "* Type 7 to remove the last value from the list"
  puts "* Type 8 to check if the list contains a given value"
  puts "* Type 9 to search for a value"
  puts "* Type 10 to show the complete list"
  puts "* Type 11 to show the first value in the list"
  puts "* Type 12 to show the last value in the list"
  puts "* Type 99 to exit"

  input = gets.chomp.to_i

  case input
  when 1
    puts "Enter a value to append:"
    val = gets.chomp.to_i
    list.append(val)
  when 2
    puts "Enter a value to prepend:"
    val = gets.chomp.to_i
    list.prepend(val)
  when 3
    puts "Enter a value to add:"
    val = gets.chomp.to_i
    puts "Enter the index:"
    idx = gets.chomp.to_i
    list.insert_at(val, idx)
  when 4
    puts "Enter the index:"
    idx = gets.chomp.to_i
    list.remove_at(idx)
  when 5
    puts list.size
  when 6
    puts "Enter the index:"
    idx = gets.chomp.to_i
    list.at(idx)
  when 7
    list.pop
  when 8
    puts "Enter a value:"
    val = gets.chomp.to_i
    if list.contains?(value)
      puts "#{val} is in the list!"
    else puts "#{val} is not in the list"
    end
  when 9
    puts "Enter a value to find"
    val = gets.chomp.to_i
    list.find(val)
  when 10
    list.to_s
  when 11
    puts list.head.value
  when 12
    puts list.tail.value
  when 99
    break
  else puts "incorrect input"
  end
end
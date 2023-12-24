class LinkedList

  attr_accessor :head, :tail, :total_nodes

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
    @size += 1
  end

  def at(index)
    return nil if index < 0 || index >= @size
    current = @head
    index.times { current = current.next_node }
    current
  end

  def pop
    return nil if @head.nil?

    if @size == 1
      @head = nil
      @tail = nil
    else
      current = @head
      current = current.next_node until current.next_node == @tail
      @tail = current
      @tail.next_node = nil
    end
    @size -= 1
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    result = ''
    current = @head
    while current
      result += "( #{current.value} ) -> "
      current = current.next_node
    end
    result += 'nil'
    result
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def value
    @value
  end
end

my_list = LinkedList.new
my_list.append(6)
my_list.append(11)
my_list.append(5)
my_list.prepend('hey')

puts "Size: #{my_list.size}"
puts "Head: #{my_list.head.value}"
puts "Tail: #{my_list.tail.value}"
puts "Node at index 2: #{my_list.at(2).value}"
puts "Contains '2': #{my_list.contains?(2)}"
puts "Index of 'hey': #{my_list.find('hey')}"
puts my_list.to_s

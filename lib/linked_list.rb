require "./lib/node.rb"

class LinkedList
  def initialize
    @head = nil
  end

  def head
    @head.value
  end

  def tail(node = @head)
    node.next_node ? tail(node.next_node) : node.value
  end

  def append(value)
    @head ? self.tail_node.next_node = new_node(value) : @head = new_node(value)
  end

  def prepend(value)
    node = Node.new(value, @head)
    @head = node
  end

  def size(node = @head)
    tail?(node) ? 1 : 1 + size(node.next_node)
  end

  def at(index)
    #raise "Range Error in intance of LinkedList.at : Index must be greater than or equal to 0" if index < 0
    index = self.size + index if index < 0
    i = 0
    node = @head
    while i < index
      node = (node.next_node ? node.next_node : nil)
      break if node == nil
      i += 1
    end
    node = nil if index < 0
    node != nil && node.value != nil ? node.value : nil
  end

  def pop!(node = @head)
    return @head = nil if tail?(node)
    tail?(node.next_node) ? node.next_node = nil : pop!(node.next_node)
  end

  def contains?(value, node = @head)
    if node.value == value
      true
    else
      tail?(node) ? false : contains?(value, node.next_node)
    end
  end

  def find(value, node = @head, index = 0)
    if node.value == value
      return index
    else
      tail?(node) ? false : find(value, node.next_node, index + 1)
    end
  end

  def to_s(node = @head)
    if tail?(node)
      node ? "( #{node.value} ) -> nil" : "nil -> nil"
    else
      "( #{node.value} ) -> " + to_s(node.next_node)
    end
  end

  def insert_at(value, index)
    index = self.size + index if index < 0
    raise "Range Error: invalid index supplied for insert_at method" if index >= self.size || index < 0
    if index == 0
      self.prepend(value)
    else
      i = 0
      node = @head
      while i < index - 1
        node = node.next_node
        i += 1
      end
      node_to_insert = new_node(value, node.next_node)
      node.next_node = node_to_insert
    end
  end

  def remove_at(index)
    index = self.size + index if index < 0
    raise "Range Error: invalid index supplied for remove_at method" if index >= self.size || index < 0
    if index == 0
      @head = @head.next_node
    else
      i = 0
      node = @head
      while i < index - 1
        node = node.next_node
        i += 1
      end
      node.next_node = node.next_node.next_node
    end
  end

  private

  def tail?(node)
    node&.next_node ? false : true
  end

  def tail_node(node = @head)
    node.next_node ? tail_node(node.next_node) : node
  end

  def new_node(value, next_node = nil)
    Node.new(value, next_node)
  end
end

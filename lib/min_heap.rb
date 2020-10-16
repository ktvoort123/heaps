class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    index_of_new_node = @store.length
    @store[index_of_new_node] = new_node
    heap_up(index_of_new_node)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    first_item_node = @store[0]
    return if @store.length == 1
    @store[0] = @store[@store.length - 1]
    @store.pop()
    heap_down(0)
    return first_item_node.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    raise NotImplementedError, "Method not implemented yet..."
  end

  private

  def what_is_parent_of(index)
    if ((index-1)/2.0)%1 == 0 #left child
      return (index-1)/2
    elsif ((index-2)/2.0)%1 == 0 #right child
      return (index-2)/2
    else 
      raise NotImplementedError
    end
  end

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    # puts("here for index #{index}")
    if index == 0
      return
    else
      parent_index = what_is_parent_of(index)
      if @store[parent_index].key > @store[index].key
        # puts("going to do the switch!!!!!!!!!!")
        new_index = parent_index
        temp_parent_node = @store[parent_index]
        @store[new_index] = @store[index]
        @store[index] = temp_parent_node
        # print(@store)
        # puts("---------------------------------------------------------")
        heap_up(new_index)
      else
        return
      end
    end
  end

  def left_child(index)
    left_child_index = (index * 2) + 1
    return nil if left_child_index > (@store.length - 1)
    return left_child_index
  end

  def right_child(index)
    right_child_index = (index * 2) + 2
    return nil if right_child_index > (@store.length - 1)
    return right_child_index
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
 # puts("here for index #{index}")
    left_child_index = left_child(index)
    right_child_index = right_child(index)
    if !left_child_index.nil? && @store[index].key > @store[left_child_index].key
      # puts("going to do the switch!!!!!!!!!!")
      new_index = index
      temp_parent_node = @store[index]
      @store[new_index] = @store[left_child_index]
      @store[left_child_index] = temp_parent_node
      # print(@store)
      # puts("---------------------------------------------------------")
      heap_down(new_index)
    elsif !right_child_index.nil? && @store[index].key > @store[right_child_index].key
        # puts("going to do the switch!!!!!!!!!!")
        new_index = index
        temp_parent_node = @store[index]
        @store[new_index] = @store[right_child_index]
        @store[right_child_index] = temp_parent_node
        # print(@store)
        # puts("---------------------------------------------------------")
        heap_down(new_index)
    else
      return
    end
  
end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
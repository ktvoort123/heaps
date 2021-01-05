

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  return list if list.length <= 1
  
  my_heap = MinHeap.new
  list.each do |item|
    my_heap.add(item, item.to_s)
  end

  my_heap.store.each_with_index do |item, index|
    list[index] = item.value.to_i
    puts(item)
  end
  return list
end
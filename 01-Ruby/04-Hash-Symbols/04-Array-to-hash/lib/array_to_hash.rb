def array_to_hash(array)
  #TODO: implement the method :)
  hash = {}

  array.each_with_index.map do |key, index|
    block_given? ? hash[yield(index)] = key : hash[index] = key
  end
  p hash
end
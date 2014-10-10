def shuffle_word(a_word)
  # TODO: refactor this method
  a_word.upcase.chars.to_a.shuffle

end

def quote_prime_numbers(n)
  # TODO: refactor this method
  prime_nb = (1..n).find_all do |i|
    (2...i).none? { |k| i % k == 0 }
  end

  prime_nb.map{ |prime_num| "#{prime_num} is prime"}

end
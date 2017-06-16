def word_counter
  file = ARGV[0]
  num = ARGV[1].to_i
  hash = {}
  words = File.read(file).scan(/\w+/).each { |word| word.downcase! }

  words.each do |word|
    if !hash.has_key?(word)
      hash[word] = words.select { |dup| dup == word }.length
    end
  end

  sorted = hash.sort_by {|_key, value| value}.reverse.to_h

  count = 0

  sorted.each do |key, value|
    if count < num
      puts "#{key}: #{value}\n"
      count += 1
    end
  end
end

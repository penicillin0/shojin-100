require 'set'
n = gets.chomp.to_i

def divisors_count n

  divisors = []

  (n**0.5).to_i.times do |i|
    i = i + 1
    if n.even?
      next
    end

    if (n % i).zero?
      divisors.push i
      divisors.push n.div(i)
    end
  end

  divisors.to_set.size
end

count = 0

n.times do |i|
  if divisors_count(i + 1) == 8
    count += 1
  end
end

puts count

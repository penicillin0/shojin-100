loop do
  n, x = gets.split.map(&:to_i)
  break if n == 0 && x == 0

  ans = 0
  1.upto(n-2) do |i|
    (i+1).upto(n-1) do |j|
      (j+1).upto(n) do |k|
        ans += 1 if i + j + k == x
      end
    end
  end

  puts ans
end

n, m = gets.chomp.split.map(&:to_i)
scores = (1..n).map do
  gets.chop.split.map(&:to_i)
end

def main(n, m, scores)
  ans = 0
  (1..m).each do |t1|
    (t1..m).each do |t2|
      sum = 0
      (1..n).each do |i|
        sum += [scores[i - 1][t1 - 1], scores[i - 1][t2 - 1]].max
      end
      ans = sum if ans < sum
    end
  end
  ans
end

puts main(n, m, scores)


# require 'minitest/autorun'

# class FooTest < Minitest::Test
#   def test_case1
#     assert_equal(84, main(1, 2, [[80, 84]]))
#   end

#   def test_case2
#     assert_equal(
#       250,
#       main(3, 4, [[37, 29, 70, 41], [85, 69, 76, 50], [53, 10, 95, 100]])
#     )
#   end

#   def test_case3
#     assert_equal(
#       581000000,
#       main(8, 2,
#         [
#           [31000000, 41000000],
#           [59000000, 26000000],
#           [53000000, 58000000],
#           [97000000, 93000000],
#           [23000000, 84000000],
#           [62000000, 64000000],
#           [33000000, 83000000],
#           [27000000, 95000000],
#         ]
#       )
#     )
#   end
# end

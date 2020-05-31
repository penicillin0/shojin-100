a, b, c, x, y = gets.chomp.split.map(&:to_i)

def main(a, b, c, x, y)
  count_ab = [x, y].max * 2
  min_price = Float::INFINITY
  (0..count_ab).reverse_each do |c_ab|
    c_a = [x - c_ab.div(2), 0].max
    c_b = [y - c_ab.div(2), 0].max
    price = c_a * a + c_b * b + c_ab * c
    min_price = price if price < min_price
  end
  return min_price
end

puts main(a, b, c, x, y)


# require 'minitest/autorun'

# class FooTest < Minitest::Test
#   def test_case1
#     assert_equal(7900, main(1500, 2000, 1600, 3, 2))
#   end

#   def test_case2
#     assert_equal(8500, main(1500, 2000, 1900, 3, 2))
#   end
# end

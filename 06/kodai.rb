# n = gets.chomp.to_i
# s = gets.chomp.split(//).map(&:to_i)


def main(n, s)
  sum = 0
  (0..9).each do |i|
    (0..9).each do |j|
      (0..9).each do |k|
        arr = s.clone

        index1 = arr.find_index(i)
        next unless index1

        rindex3 = arr.reverse.find_index(k)
        next unless rindex3
        index3 = n - rindex3 - 1

        if index1 < index3
          if arr[index1+1..index3-1].include?(j)
            sum += 1
          end
        end
      end
    end
  end
  sum
end

# puts main(n, s)


require 'minitest/autorun'

class FooTest < Minitest::Test
  def test_case1
    assert_equal(3, main(4, '0224'.split(//).map(&:to_i)))
  end

  def test_case2
    assert_equal(17, main(6, '123123'.split(//).map(&:to_i)))
  end

  def test_case3
    assert_equal(329, main(19, '3141592653589793238'.split(//).map(&:to_i)))
  end
end

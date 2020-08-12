r, c = gets.chomp.split.map(&:to_i)
rice_crackers = (1..r).map {
  gets.chomp.split.map(&:to_i)
}

def main(r, c, rice_crackers)
  max = 0
  (0..2**r- 1).each do |n_ten|
    n_two = n_ten.to_s(2).rjust(r, '0')
    must_flips = n_two.chars.map { |char| char == '1' }
    rice_crackers_r = rice_crackers.map.with_index { |row, index|
      must_flips[index] ? row.map { |elm| elm == 1 ? 0 : 1 } : row
    }
    rice_crackers_r_c = rice_crackers_r.transpose.map { |column|
      r / 2 < column.count { |elm| elm == 1 } ? column.map { |elm| elm == 1 ? 0 : 1 } : column
    }
    max = [rice_crackers_r_c.flatten.count { |elm| elm == 0 }, max].max
  end
  max
end

puts main(r, c, rice_crackers)

require 'minitest/autorun'

class FooTest < Minitest::Test
  def test_case1
    assert_equal(9, main(2, 5, [[0, 1, 0, 1, 0], [1, 0, 0, 0, 1]]))
  end

  def test_case2
    assert_equal(15, main(3, 6, [[1, 0, 0, 0, 1, 0], [1, 1, 1, 0, 1, 0], [1, 0, 1, 1, 0, 1]]))
  end
end



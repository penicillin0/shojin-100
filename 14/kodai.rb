n, k = gets.chomp.split.map(&:to_i)
buildings = gets.chomp.split.map(&:to_i)

def main(n, k, buildings)
  min = Float::INFINITY
  (0..2**n-1).each do |n_ten|
    n_two = n_ten.to_s(2).rjust(n, '0')
    extending = n_two.chars.map(&:to_i)
    next if extending.count { |flag| flag == 1 } < k

    amount = 0

    dupped_buildings = buildings.dup
    current_max = 0
    dupped_buildings.each.with_index do |building, index| 
      if index == 0
        current_max = [building, current_max].max
        next building 
      end

      if extending[index] == 0
        current_max = [building, current_max].max
        next building 
      end

      if current_max < dupped_buildings[index]
        current_max = [dupped_buildings[index], current_max].max
        next dupped_buildings[index]
      else
        diff = (current_max - dupped_buildings[index]) + 1
        dupped_buildings[index] += diff
        amount += diff
        current_max = [dupped_buildings[index], current_max].max
        next dupped_buildings[index]
      end
    end

    
    amount = amount

    if amount < min
      min = amount 
    end
  end
  min 
end

puts main(n, k, buildings)

require 'minitest/autorun'

class FooTest < Minitest::Test
  def test_case1
    assert_equal(1541, main(5, 5, [3949, 3774, 3598, 3469, 3424]))
  end

  def test_case2
    assert_equal(7, main(5, 3, [7, 4, 2, 6, 4]))
  end
end






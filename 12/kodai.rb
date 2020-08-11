n, m = gets.chomp.split.map(&:to_i)
relations = (1..m).map {
  gets.chomp.split.map(&:to_i)
}

def main(n, m, relations)
  max_number_of_faction = 0
  (0..2**n - 1).each do |n_ten|
    n_two = n_ten.to_s(2).rjust(n, '0')
    faction = n_two.chars.map.with_index { |member, index| member == '1' ? index + 1 : nil }.compact

    is_know_each_other = true
    faction.combination(2).to_a.each { |pair|
      is_know_each_other = false and break unless relations.include?(pair)
    }
    if is_know_each_other
      max_number_of_faction = [max_number_of_faction, faction.size].max
    end
  end
  max_number_of_faction
end

puts main(n, m, relations)

# require 'minitest/autorun'

# class FooTest < Minitest::Test
#   def test_case1
#     assert_equal(3, main(5, 3, [[1, 2], [2, 3], [1, 3]]))
#   end
# end

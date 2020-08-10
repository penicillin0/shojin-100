n, m = gets.chomp.split.map(&:to_i)
k_list_list = (1..m).map do
  gets.chomp.split.map(&:to_i)
end

p_list = gets.chomp.split.map(&:to_i)


def main(n, m, k_list_list, p_list)

  ans = 0;
  (0..2**n - 1).each do |n_ten|
    n_two = n_ten.to_s(2).rjust(n, '0')
    all_switch_statuses = n_two.chars.map(&:to_i)

    light_statuses = (0..m-1).map do |light_index|
      switch_indexes = k_list_list[light_index][1..]
      is_on = switch_indexes.map{ |index| 
        all_switch_statuses[index - 1] 
      }.sum % 2 === p_list[light_index]
    end

    unless light_statuses.include?(false)
      ans += 1
    end
  end
  ans
end

puts main(n, m, k_list_list, p_list)


# require 'minitest/autorun'

# class FooTest < Minitest::Test
#   def test_case1
#     assert_equal(1, main(2, 2, [[2, 1, 2], [1, 2]], [0, 1]))
#   end
# end




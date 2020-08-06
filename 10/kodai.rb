require 'set'
num_of_n = gets.chomp.to_i
n_list = gets.chomp.split.map(&:to_i)

num_of_m = gets.chomp.to_i
m_list = gets.chomp.split.map(&:to_i)


def main(num_of_n, n_list, num_of_m, m_list)
  sum_list = [].to_set

  (1..2**num_of_n).each do |n_ten|
    n_two = n_ten.to_s(2).rjust(num_of_n, '0')
    sum = n_two.chars.map(&:to_i).map.with_index{ |flag, index| flag == 1 ? n_list[index] : 0 }.sum

    sum_list.add(sum)
  end

  m_list.each do |m|
    if sum_list.include?(m)
      puts 'yes'
    else
      puts 'no'
    end
  end
end

main(num_of_n, n_list, num_of_m, m_list)

# require 'minitest/autorun'

# class FooTest < Minitest::Test
#   def test_case1
#     assert_equal(["no", "no", "yes", "yes"], main(5, [1, 5, 7, 10, 21], 4, [2, 4, 17, 8]))
#   end
# end



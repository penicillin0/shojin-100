num_of_m = gets.chomp.to_i
m_list = (1..num_of_m).map do
  gets.chomp.split.map(&:to_i)
end

num_of_n = gets.chomp.to_i
n_list = (1..num_of_n).map do
  gets.chomp.split.map(&:to_i)
end


def main(num_of_m, m_list, num_of_n, n_list)
  m_list.sort! do |m1, m2|
    m1 <=> m2
  end
  n_list.sort! do |n1, n2|
    n1 <=> n2
  end

  ans = [nil, nil]
  count = 0
  (0..num_of_n-1).each do |index|
    m_rep = m_list[0]
    n_rep = n_list[index]
    diff = [n_rep[0] - m_rep[0], n_rep[1] - m_rep[1]]

    ok = true

    m_list.each do |m|
      n_exp = [m[0] + diff[0], m[1] + diff[1]]
      count += 1
      unless n_list.include?(n_exp)
        ok = false
        break
      end
    end

    if ok == true
      ans = diff
      break
    end
  end
  ans.join(" ")
end

puts main(num_of_m, m_list, num_of_n, n_list)

# require 'minitest/autorun'

# class FooTest < Minitest::Test
#   def test_case1
#     assert_equal([2, -3], main(5, [[8, 5], [6, 4], [4, 3], [7, 10], [0, 10]], 10, [[10, 5], [2, 7], [9, 7], [8, 10], [10, 2], [1, 2], [8, 1], [6, 7], [6, 0], [0, 9]]))
#   end

#   def test_case2
#     assert_equal([-384281, 179674], main(5, [[904207, 809784], [845370, 244806], [499091, 59863], [638406, 182509], [435076, 362268]], 10, [[757559 ,866424], [114810 ,239537], [114810 ,239537], [519926 ,989458], [519926 ,989458], [461089 ,424480], [461089 ,424480], [674361 ,448440], [254125 ,362183], [50795 ,541942]]))
#   end
# end


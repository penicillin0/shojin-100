load '07/kodai.rb'
require 'minitest/autorun'
class FooTest < Minitest::Test
  def test_case1
    assert_equal(10, main([[9, 4], [4, 3], [1, 1], [4, 2], [2, 4], [5, 8], [4, 0], [5, 3], [0, 5], [5, 2]]))
  end

  def test_case2
    assert_equal([-2, 3], degree_plus90([0, 0], [3, 2]))
    assert_equal([2, -3], degree_minus90([0, 0], [3, 2]))
    assert_equal([3, 6], degree_plus90([2, 4], [4, 3]))
    assert_equal([1, 2], degree_minus90([2, 4], [4, 3]))
  end
end
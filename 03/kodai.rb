ACGT = %w[A C G T].freeze

def main s
  ans = 0
  count = 0
  s.each_char.to_a.map do |c|
    if ACGT.include? c
      count += 1
      ans = count if ans < count
    else
      count = 0
    end
  end

  ans
end

s = gets.chomp
puts main(s)

require 'minitest/autorun'

class FooTest < Minitest::Test
  def test_case1
    assert_equal(main('ATCODER'), 3)
  end

  def test_case2
    assert_equal(main('HATAGAYA'), 5)
  end

  def test_case3
    assert_equal(main('A'), 1)
  end
end
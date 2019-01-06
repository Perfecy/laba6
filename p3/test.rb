require './main.rb'
require 'minitest/autorun'

# Test class
class Mytest < Minitest::Test
  def setup
    @intgrl1 = 7.5846684
    @intgrl2 = -0.376871
  end

  def test_1_block
    res = my_func(-1.0, 4.0, 10_000_00.0) { |x| x + Math.cos(x) }
    assert_in_delta(@intgrl1, res, 10**-4)
  end

  def test_1_lambda
    res = my_func(-1.0, 4.0, 10_000_00.0, proc { |x| x + Math.cos(x) })
    assert_in_delta(@intgrl1, res, 10**-4)
  end

  def test_2_block
    res = my_func(1.0, 2.0, 10_000_00.0) { |x| Math.tan(x + 1) / (x + 1) }
    assert_in_delta(@intgrl2, res, 10**-4)
  end

  def test_2_lambda
    res = my_func(1.0, 2.0, 10_000_00.0, proc { |x| Math.tan(x + 1) / (x + 1) })
    assert_in_delta(@intgrl2, res, 10**-4)
  end
end

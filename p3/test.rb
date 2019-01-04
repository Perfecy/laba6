require './main.rb'
require 'minitest/autorun'

# Class for testing
class Mytest < Minitest::Test
  def setup
    @intgrl1 = 7.5846684
    @intgrl2 = -0.376871
  end

  def test_1_block
    res = trap(-1.0, 4.0, 10_000_000.0) { |x| x + Math.cos(x) }
    assert_in_delta(@intgrl1, res, 10**-5)
  end

  def test_1_lambda
    res = trap(-1.0, 4.0, 10_000_000.0, &->(x) { x + Math.cos(x) })
    assert_in_delta(@intgrl1, res, 10**-5)
  end

  def test_2_block
    res = trap(1.0, 2.0, 10_000_000.0) { |x| Math.tan(x + 1) / (x + 1) }
    assert_in_delta(@intgrl2, res, 10**-5)
  end

  def test_2_lambda
    res = trap(1.0, 2.0, 10_000_000.0, &->(x) { Math.tan(x + 1) / (x + 1) })
    assert_in_delta(@intgrl2, res, 10**-5)
  end


end

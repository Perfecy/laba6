require './main.rb'
require 'minitest/autorun'

class Test < MiniTest::Unit::TestCase


  def test_1
    assert_in_delta(0.693147, count(-2), 1e-2)
  end

  def test_2
    assert_in_delta(0.693147, count(-4), 1e-4)
  end


end

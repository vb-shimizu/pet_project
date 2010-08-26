require 'example'
require 'test/unit'

class TestExample < Test::Unit::TestCase
  def test_x
    assert_equal 1, Example.new.x  
  end
end


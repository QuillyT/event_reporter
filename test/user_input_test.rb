require 'minitest'
require 'minitest/autorun'
require './lib/user_input'

class UserInputTest < MiniTest::Test
  def test_if_exists
    i = UserInput.new
    assert_kind_of UserInput,i
  end
end


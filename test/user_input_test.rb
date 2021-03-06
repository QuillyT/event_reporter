require 'minitest'
require 'minitest/autorun'
require './lib/user_input'

class UserInputTest < MiniTest::Test
  def setup
    @user = UserInput.new
  end

  def test_if_exists
    i = UserInput.new
    assert_kind_of UserInput,i
  end
  def test_if_command_attribute_exists
    format('q')
    assert_equal @user.command,'q'
  end

  def command_test(input,cmd)
    format(input)
    assert_equal @user.command,cmd
  end

  def test_if_command_is_set_to_help
    command_test("help",:help)
  end
  def test_if_command_is_set_to_queue_count
    command_test("queue count",:count)
  end
  def test_if_command_is_set_to_queue_clear
    command_test("queue clear",:clear)
  end
  def test_if_command_is_set_to_queue_print
    command_test("queue print",:print)
  end
  def test_if_command_is_set_to_queue_print_by
    command_test("queue print by",:print_by)
  end
  def test_if_command_is_set_to_queue_save_to
    command_test("queue save to",:save)
  end
  def test_if_command_is_set_to_find
    command_test("find",:find)
  end
end


require 'minitest'
require 'minitest/autorun'
require './lib/user_input'

class UserInputTest < MiniTest::Test
  def test_if_exists
    i = UserInput.new
    assert_kind_of UserInput,i
  end
  def test_if_command_attribute_exists
    i = UserInput.new
    i.read('q')
    assert_equal i.command,'q'
  end
  def test_if_command_is_set_to_help
    i = UserInput.new
  end
  def test_if_command_is_set_to_queue_count
  end
  def test_if_command_is_set_to_queue_clear
  end
  def test_if_command_is_set_to_queue_print
  end
  def test_if_command_is_set_to_queue_print_by
  end
  def test_if_command_is_set_to_queue_save_to
  end
  def test_if_command_is_set_to_find
  end
end


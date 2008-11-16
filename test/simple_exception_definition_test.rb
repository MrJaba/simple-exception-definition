require 'test/unit'
require 'simple_exception_definition'

class SimpleExceptionDefinitionTest < Test::Unit::TestCase
  define_exception :test_exception
  define_exceptions :test_exception_a, :test_exception_b
  
  def test_define_single_exception_constant
    assert_not_nil Object.const_get("TestException")
  end
  
  def test_define_single_exception_class
    assert_equal "TestException", TestException.new.class.to_s
  end
  
  def test_behave_as_exception
    assert_raise(TestException){ raise TestException.new }
  end
  
  def test_pass_error_message
    assert_equal "Test", TestException.new("Test").message
  end
  
  def test_pass_error_subject_object
    i = []
    assert_equal i, TestException.new("Test", i).object
  end
  
  def test_define_multiple_exceptions
    assert_not_nil Object.const_get("TestExceptionA")
    assert_not_nil Object.const_get("TestExceptionB")
  end
  
end

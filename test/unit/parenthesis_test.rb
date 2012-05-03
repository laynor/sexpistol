require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class ParenthesesTest < Test::Unit::TestCase

  def setup
    @parser = Sexpistol.new
  end

  test "should parse sexp containing diffent types of parentheses" do
  	  ast = @parser.parse_string("([1 2 3] {4 5 6})")
    assert_equal [[[1, 2, 3], [4, 5, 6]]], ast
  end
  
  test "should parse sexp quoting diffent types of parentheses" do
  	  ast = @parser.parse_string("'('[1 2 3] '{4 5 6})")
  	  assert_equal [[:quote, [[:quote, [1, 2, 3]], [:quote, [4, 5, 6]]]]], ast
  end

    
end

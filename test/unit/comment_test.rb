require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class CommentTest < Test::Unit::TestCase

  def setup
    @parser = Sexpistol.new
  end

  test "should parse sexp containing an integer literal ignoring the comment" do
  	  ast = @parser.parse_string("(10) ; a comment")
    assert_equal [[10]], ast
  end
  
  test "should parse sexp containing comments in many lines" do
    ast = @parser.parse_string(";; heading comment\n (10 ;first comment\n 20) ; a comment")
    assert_equal [[10, 20]], ast
  end
    
end

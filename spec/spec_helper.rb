require 'brototype'

class Foo
  attr_accessor :fired

  def initialize
    @fired = false
    @success = false
    @param = nil
    @bar = 3
  end
  
  def foo
    @fired = true
    91
  end
  
  def throws_error
    throw :an_error
  end

end
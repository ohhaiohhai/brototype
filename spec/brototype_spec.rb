require 'spec_helper'

describe Brototype do

  before do
    @bro = Brototype::Bro.new('foo' =>  {'bar' => 'baz'})
    @anon_class = Foo.new
  end

  describe '#do_you_even' do

    it 'should return true for defined properties' do
      expect(@bro.do_you_even?('foo')).to be true
    end

    it 'should return true for nested properties' do
      expect(@bro.do_you_even?('foo.bar')).to be true
    end
    
    it 'should return false for undefined properties' do
      expect(@bro.do_you_even?('foo.nada')).to be false
    end

  end

  describe '#i_can_haz' do

    it 'should return the value of the deep property' do
      expect(@bro.i_can_haz('foo.bar')).to eq('baz')
    end

    it 'should return nil for missing property' do
      expect(@bro.i_can_haz('foo.nada')).to be_nil
    end

  end

  describe '#all_the_things' do

    it 'should return an object\'s keys' do
      keys = @bro.all_the_things
      

    end

    it 'should return the keys in order' do
      # TODO
    end

  end

  describe '#i_dont_always' do

    it 'should check that the requested method is a function' do
      success = false
      @anon_bro = Brototype::Bro.new(@anon_class)
      
      @anon_bro.i_dont_always('foo.bar').but_when_i_do(lambda { |x|
        success = true
      })
      expect(success).to be false
      
      @anon_bro.i_dont_always('foo').but_when_i_do(lambda { |x|
        success = true
      })
      expect(success).to be true
    end

    it 'should run the requested method if a function' do
    
      fn = lambda {|x|1}
      @anon_bro = Brototype::Bro.new(@anon_class)
      
      @anon_bro.i_dont_always('bar').but_when_i_do(fn)
      expect(@anon_bro.i_can_haz('fired')).to be false
      
      @anon_bro.i_dont_always('foo').but_when_i_do(fn)
      expect(@anon_bro.i_can_haz('fired')).to be true
    end

    it 'should pass the method\'s return value as param to callback' do
      param = nil
      Brototype::Bro.new(@anon_class).i_dont_always('foo').but_when_i_do(lambda { |x|
        param = x
      })
      expect(param).to be 91
    end
    
    it 'should work with hash keys too' do
      success = false
      result = nil
      
      @bro.i_dont_always('foo.baz').but_when_i_do(lambda { |x|
        success = true
      })
      expect(success).to be false
      
      @bro.i_dont_always('foo.bar').but_when_i_do(lambda { |x|
        success = true
        result = x
      })
      expect(result).to eq("baz")
    
    end

  end

  describe '#brace_yourself' do
  
    it 'should fire the callback when an exception is thrown' do
      success = false
      Brototype::Bro.new(@anon_class).brace_yourself('throws_error').here_come_the_errors(lambda { |x|
        success = true
      })
      expect(success).to be true
    end
  
    it 'should pass the error to the callback' do
      error = nil
      Brototype::Bro.new(@anon_class).brace_yourself('throws_error').here_come_the_errors(lambda { |x|
        error = x
      })
      expect(error.class).to eq(ArgumentError)
    end
    
  end

end
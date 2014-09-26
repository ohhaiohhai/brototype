module Brototype
  class Bro
    
    TOTALLY = true
    NOWAY = false
    
    class << self
      def sup?(obj)
        self.new(obj)
      end

      def is_that_even_a_thing?(obj)
        !(obj.nil? || obj.empty?)
      end
    end

    def initialize(obj)
      @obj = obj;
    end

    def is_that_even_a_thing?
      self.class.is_that_even_a_thing?(@obj)
    end

    def do_you_even?(*args)
      self.class.is_that_even_a_thing? self.i_can_haz(*args)
    end

    def i_can_haz(*args)
      # TODO if key is an array, return all
      if @obj.is_a?(Hash)
        # split up the incoming keys and dig into the hash to find the last value
        args.inject(@obj) do |memo, k|
          # make sure it's a hash (could be nil from the last iteration) and that is the key in either format
          if memo.is_a? Hash and (memo.has_key?(k) or memo.has_key?(k.to_sym))
            # use ternary operator instead of straight "this || that" so that if the key's value is nil or false it'll still return
            memo.has_key?(k) ? memo[k] : memo[k.to_sym]
          else
            # nothing found, get out of here
            nil
          end
        end
      elsif args.count > 0
        key = args.first
        if @obj.respond_to? key
          @obj.send(key)
        elsif key.start_with?("@")
          @obj.instance_variable_get key
        else
          nil
        end
      else 
        nil
      end
    end
    
    def all_the_things
      # TODO
    end
    
    def i_dont_always(*methodString)
      Bromise.new(@obj, *methodString)
    end
    
    def brace_yourself(*methodString)
      Bromise.new(@obj, *methodString)
    end

  end
end

module Brototype
  class Bro
    
    TOTALLY = true
    NOWAY = false

    def initialize(obj)
      @obj = obj;
    end

    def is_that_even_a_thing
      (@obj.nil? || @obj.empty?) ? false : true
    end

    def do_you_even(key, options = {})
      options_bro = Bro.new(options || {})
      bro = self.i_can_haz(key)
      if Bro.new(bro).is_that_even_a_thing == TOTALLY
        TOTALLY;
      else
        NOWAY
      end

    end

    def i_can_haz(key)
      # TODO if key is an array, return all
      if @obj.is_a?(Hash)
        key.split('.').inject(@obj) do |c, v|
          c.respond_to?(:keys) ? c[v] : nil
        end
      else
        if @obj.respond_to?(key)
          @obj.send(key)
        elsif key.start_with?("@")
          @obj.instance_variable_get(key)
        else
          nil
        end
      end
    end
    
    def all_the_things
      # TODO
    end
    
    def i_dont_always(methodString)
      Bromise.new(@obj, methodString)
    end
    
    def brace_yourself(methodString)
      Bromise.new(@obj, methodString)
    end

  end
end
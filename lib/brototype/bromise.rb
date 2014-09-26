module Brototype

  # Bromise... it's stronger than a Promise
  class Bromise

    def initialize(object, *args)
      @object = object
      #@method = method
      @args = args
    end

    def but_when_i(&block)
      return_value = Bro.new(@object).i_can_haz(*@args)
      if return_value
        (block || {}).call return_value
      end
    end

    def here_come_the_errors(&block)
      begin
         Bro.new(@object).i_can_haz(*@args)
      rescue  Exception => e
        block.call e
      end
    end

    def errors_are_coming
      self.here_come_the_errors.call
    end

  end
end
    
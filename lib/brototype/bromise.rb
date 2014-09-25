module Brototype

  # Bromise... it's stronger than a Promise
  class Bromise

    def initialize(object, method=nil, args=[])
      @object = object
      @method = method
      @args = args.count > 1 ? args.slice(1) : []
    end

    def but_when_i(&block)
      but_when_i_do block
    end

    def but_when_i_do(callback=nil)
      return_value = nil
      if @object.respond_to? @method
        return_value = @object.send(@method)
      else
        return_value = Bro.new(@object).i_can_haz @method
      end
      if return_value
        (callback || (lambda {|x|1})).call return_value
      end
    end

    def here_come_the_errors(callback=nil)
      if @object.respond_to? @method
        begin
          @object.send(@method)
        rescue  Exception => e
          callback.call e
        end
      else
        callback(@method + ' is not a proc');
      end
    end

    def errors_are_coming
      self.here_come_the_errors.call
    end

  end
end
    
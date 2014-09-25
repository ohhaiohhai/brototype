# Brototype

Bro, do you even Ruby?

This is a ruby port of the popular brototype.js library that can be found here:
https://github.com/letsgetrandy/brototype



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'brototype'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brototype

## Rspec is used to run the tests, just do:

```
RSpec::Core::RakeTask.new(:spec)
```

## Features

You've got a deeply-nested set of objects that may or may not always be there.
We've all seen something like this:

```
if params[:model] && params[:model] && params[:model][:id]
    # do something
end
```

We all hate that, don't we?

So what if you could just type:
```
Brototype::Bro.new(params).i_can_haz(':model.:id')
```

Or better yet, how about:
```
Brototype::Bro.new(params).i_dont_always(':model.:id').but_when_i_do(lambda {
  |id| puts id
})
```

Fetch nested properties by string or key:
```
Brototype::Bro.new(:foo => {:bar => 1}).i_can_haz(':foo.:bar')
Brototype::Bro.new('foo' => {'bar' => 1}).i_can_haz('foo.bar')
```

### Handling exceptions
```
Brototype::Bro.new(@anon_class).brace_yourself('throws_error').here_come_the_errors(lambda { |e|
  puts 'error ' + e + ' happened.'
})
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/brototype/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


# png-encode

Encode/decode arbitrary data within the PNG file format.

## Installation

Add this line to your application's Gemfile:

    gem 'png-encode'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install png-encode

## Usage

Right now there are only 2 straightforward methods to use:

``` ruby
require 'png-encode'

PNG.encode(infile, outfile)
PNG.decode(infile, outfile)
```

These will be made more flexible in the future.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

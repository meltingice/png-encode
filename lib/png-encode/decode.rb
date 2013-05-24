class PNG
  module Decode
    def self.included(base)
      base.send :include, InstanceMethods
      base.extend ClassMethods
    end

    module ClassMethods
      def decode(infile, outfile, opts={})
        self.new(ChunkyPNG::Image.from_file(infile), opts).decode(outfile)
      end
    end

    module InstanceMethods
      def decode(outfile)
        data = self.send("decode_#{@opts[:method]}")

        file = File.new(outfile, 'r+b')
        file.write(data)
        file.seek 0
        
        @data = file
        return @data
      end
    end
  end
end
class PNG
  module Encode
    def self.included(base)
      base.send :include, InstanceMethods
      base.extend ClassMethods
    end

    module ClassMethods
      def encode(infile, outfile, opts={})
        infile = File.open(infile, 'r+b')
        self.new(infile, opts).encode(outfile)
      end
    end

    module InstanceMethods
      def encode(outfile)
        png = self.send "encode_#{@opts[:method]}"
        png.save outfile

        @data = png
        return @data
      end
    end
  end
end
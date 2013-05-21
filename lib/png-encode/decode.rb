class PNG
  module Decode
    def self.included(base)
      base.send :include, InstanceMethods
      base.extend ClassMethods
    end

    module ClassMethods
      def decode(infile, outfile)
        self.new(ChunkyPNG::Image.from_file(infile)).decode(outfile)
      end
    end

    module InstanceMethods
      def decode(outfile)
        output = []
        @data.pixels.each do |b|
          output << b
        end

        File.write(outfile, output.pack("C#{output.size}"))
      end
    end
  end
end
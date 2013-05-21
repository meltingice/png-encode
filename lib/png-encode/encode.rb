class PNG
  module Encode
    def self.included(base)
      base.send :include, InstanceMethods
      base.extend ClassMethods
    end

    module ClassMethods
      def encode(infile, outfile)
        self.new(File.open(infile, 'rb')).encode(outfile)
      end
    end

    module InstanceMethods
      def encode(outfile)
        png = ChunkyPNG::Image.new(1, @data.size, ChunkyPNG::Color::TRANSPARENT)

        i = 0
        @data.each_byte do |b|
          png[0, i] = b
          i += 1
        end

        png.save outfile
      end
    end
  end
end
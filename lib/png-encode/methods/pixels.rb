# Converts the file byte-by-byte into a greyscale pixel and produces an image
# that is 1 pixel wide by the byte length tall.
class PNG
  module Method
    module Pixels
      private

      def encode_pixels
        png = ChunkyPNG::Image.new(1, @data.size, ChunkyPNG::Color::TRANSPARENT)

        i = 0
        @data.each_byte do |b|
          png[0, i] = b
          i += 1
        end

        return png
      end

      def decode_pixels
        output = []
        @data.pixels.each do |b|
          output << b
        end

        return output.pack("C#{output.size}")
      end
    end
  end
end
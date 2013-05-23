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

        return output
      end
    end
  end
end
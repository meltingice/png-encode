# Uses the metadata section of the PNG format to store the byte data.
class PNG
  module Method
    module Metadata
      private

      def encode_metadata
        png = ChunkyPNG::Image.new(1, 1, ChunkyPNG::Color::TRANSPARENT)
        png.metadata['filedata'] = @data.read
        return png
      end

      def decode_metadata
        @data.metadata['filedata']
      end
    end
  end
end
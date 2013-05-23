require 'spec_helper'

describe 'Encoding' do
  before(:each) do
    @infile = File.new(FIXTURE_ROOT + "/files/test.txt", 'r+b')
    @outfile = Tempfile.new('outfile')
  end

  after(:each) do
    @outfile.close
    @outfile.unlink
  end

  it "exists" do
    PNG.should.respond_to?(:encode)
    PNG.instance_methods.should include :encode
  end

  describe "as pixels" do
    it "is available" do
      PNG.private_instance_methods.should include :encode_pixels
    end

    it "produces a valid PNG" do
      PNG.encode @infile, @outfile, method: :pixels
      ChunkyPNG::Image.from_file(@outfile.path)
    end

    it "produces a PNG of 1xlength dimensions" do
      PNG.encode @infile, @outfile, method: :pixels
      image = ChunkyPNG::Image.from_file(@outfile.path)

      image.width.should == 1
      image.height.should == @infile.size
    end

    it "produces a PNG with data" do
      PNG.encode @infile, @outfile, method: :pixels
      image = ChunkyPNG::Image.from_file(@outfile.path)

      # Pixel encoder directly converts bytes -> greyscale pixel values
      image.pixels.should == @infile.bytes.to_a
    end
  end
end
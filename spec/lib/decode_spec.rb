require 'spec_helper'

describe 'Decoding' do
  before(:each) do
    @original = File.new(FIXTURE_ROOT + "/files/test.txt", 'r+b')
    @infile = File.new(FIXTURE_ROOT + "/files/pixels.png", 'r+b')
    @outfile = Tempfile.new('outfile')
  end

  after(:each) do
    @outfile.close
    @outfile.unlink
  end

  it "exists" do
    PNG.should.respond_to?(:decode)
    PNG.instance_methods.should include :decode
  end

  describe "from pixels" do
    it "is available" do
      PNG.private_instance_methods.should include :decode_pixels
    end

    it "decodes a PNG without error" do
      PNG.decode @infile, @outfile, method: :pixels
    end

    it "produces the exact same data as the original" do
      PNG.decode @infile, @outfile, method: :pixels
      @outfile.read.should == @original.read
    end
  end
end
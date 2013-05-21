DIR_ROOT = File.dirname(File.absolute_path(__FILE__))

require DIR_ROOT + "/png-encode/version"
require DIR_ROOT + "/png-encode/encode"
require DIR_ROOT + "/png-encode/decode"

require 'chunky_png'

class PNG
  include PNG::Encode
  include PNG::Decode

  def initialize(data)
    @data = data
  end
end
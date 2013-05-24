DIR_ROOT = File.dirname(File.absolute_path(__FILE__))

require DIR_ROOT + "/png-encode/version"
require DIR_ROOT + "/png-encode/encode"
require DIR_ROOT + "/png-encode/decode"
require DIR_ROOT + "/png-encode/methods/pixels"
require DIR_ROOT + "/png-encode/methods/metadata"

require 'chunky_png'

class PNG
  include PNG::Encode
  include PNG::Decode
  include PNG::Method::Pixels
  include PNG::Method::Metadata

  DEFAULTS = {
    method: :pixels
  }

  def initialize(data, opts={})
    @data = data
    @opts = DEFAULTS.merge(opts)
  end
end
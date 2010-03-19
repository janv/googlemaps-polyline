# coding: utf-8

require "test_helper"
require "googlemaps_polyline/encoder"
require "stringio"

class EncoderTest < Test::Unit::TestCase
  def setup
    @mod = GoogleMapsPolyline::Encoder
  end

  def test_write_point
    assert_equal("?"     , @mod.write_point(sio,         0))
    #assert_equal("A"     , @mod.write_point(sio,         1))
    #assert_equal("@"     , @mod.write_point(sio,        -1))
    #assert_equal("{sopV" , @mod.write_point(sio,  12345678))
    #assert_equal("zsopV" , @mod.write_point(sio, -12345678))
    #assert_equal("_gsia@", @mod.write_point(sio,  18000000))
    #assert_equal("~fsia@", @mod.write_point(sio, -18000000))
  end

=begin
  def test_encode_points
    assert_equal(
      "??",
      @mod.decode_polyline(sio, [[0, 0]]).string)
  end
=end

  private

  def sio(string = nil)
    return StringIO.new(string || "")
  end
end

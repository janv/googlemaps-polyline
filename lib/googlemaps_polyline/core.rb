# coding: utf-8

require "googlemaps_polyline/encoder"
require "googlemaps_polyline/decoder"

module GoogleMapsPolyline
  def self.encode_points_and_levels(points, levels)
    encoded_points = Encoder.new(StringIO.new).encode_points(points).string
    encoded_levels = Encoder.new(StringIO.new).encode_levels(levels).string
    return encoded_points, encoded_levels
  end

  def self.encode_polyline_1e5(records)
    points = records.map { |record| record[0..1] }
    levels = records.map { |record| record[2] }
    return self.encode_points_and_levels(points, levels)
  end

  def self.decode_points_and_levels(points, levels)
    decoded_points = Decoder.new(StringIO.new(points)).decode_points
    decoded_levels = Decoder.new(StringIO.new(levels)).decode_levels
    return decoded_points, decoded_levels
  end

  def self.decode_polyline_1e5(points, levels)
    decoded_points, decoded_levels = self.decode_points_and_levels(points, levels)
    return decoded_points.zip(decoded_levels).map { |a| a.flatten }
  end
end

# coding: utf-8

module GoogleMapsPolyline
  module Encoder

    def self.write_num(io, num)
p num
      p negative = (num < 0)
      if negative
        num -= -1
        num *= -1
      end
p num

      #p bin = num.to_s(2)
      #bin += "0"
      #bin.slice!(0, 1)
      #bin += (negative ? "1" : "0")
      #p bin
      num <<= 1
      num  |= 1 if negative
p num.to_s(2)

      codes = []

      begin
        code = (num & 0b11111) + 63
        num >>= 5
        code |= 0x20 if num > 0
        codes << code
p codes
      end while num > 0
      #bin.tr!("01", "10") if negative
      #p bin

      char = [num + 63].pack("C")

      return codes.pack("C*")
    end

=begin
    def self.encode_points(io, points)
    end
=end
  end
end

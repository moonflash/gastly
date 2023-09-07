module Gastly
  class Image
    attr_reader :image

    # @param image [MiniMagick::Image] Instance of MiniMagick::Image
    def initialize(image)
      @image = image
    end

    # @param width [Fixnum] Image width
    # @param height [Fixnum] Image height
    def resize(width:, height:)
      dimensions = "#{width}x#{height}"
      image.resize(dimensions)
    end

    # @param width [Fixnum] Image width
    # @param height [Fixnum] Image height
    def resize_to_fit(width:, height:)
      dimensions = "#{width}x#{height}^"
      crop = "#{width}x#{height}+0+0"
      image.thumbnail(dimensions).crop(crop)
    end

    # @param ext [String] Image extension
    # @return [MiniMagick::Image] Instance
    def format(ext)
      image.format(ext)
    end

    # @param output [String] Full path to image
    # @return [String] Full path to image
    def save(output)
      image.write(output)
      output
    end
  end
end

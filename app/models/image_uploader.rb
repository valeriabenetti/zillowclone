require "image_processing/mini_magick"
class ImageUploader < Shrine
  # plugins and uploading logic
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions
  plugin :delete_raw

  process(:store) do |io, context|
    original = io.download

    size_700 = resize_to_limit!(original, 700, 700)
    size_450 = resize_to_limit!(size_700, 450, 450)
    size_200 = resize_to_limit!(size_450, 150, 150)

    { original: io, large: size_700, medium: size_450, small: size_200 }

  end
end

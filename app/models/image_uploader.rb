require "image_processing/mini_magick"
class ImageUploader < Shrine
  # plugins and uploading logic
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions
  plugin :delete_raw

  process(:store) do |io, context|
    original = io.download

    size_800 = resize_to_limit!(original, 1000, 1000)
    size_450 = resize_to_limit(size_800, 450, 450)
    size_300 = resize_to_limit(size_450, 255, 250)

    { original: io, large: size_800, medium: size_450, small: size_300 }

  end
end

class RemoveImageUrlFromHomes < ActiveRecord::Migration[5.0]
  def change
    remove_column :homes, :image_url, :string
  end
end

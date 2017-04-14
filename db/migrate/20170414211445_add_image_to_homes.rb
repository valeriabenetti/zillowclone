class AddImageToHomes < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :image_url, :string
  end
end

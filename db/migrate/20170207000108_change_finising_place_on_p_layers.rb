class ChangeFinisingPlaceOnPLayers < ActiveRecord::Migration[5.0]
  def change
    rename_column :players, :finising_place, :finishing_place
  end
end

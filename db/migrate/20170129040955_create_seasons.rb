class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.boolean :active, default: true
      t.references :league, foreign_key: true
    end
  end
end

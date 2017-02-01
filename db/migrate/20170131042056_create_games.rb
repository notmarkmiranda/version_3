class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.date :date
      t.integer :buy_in_amount
      t.references :season, foreign_key: true
    end
  end
end

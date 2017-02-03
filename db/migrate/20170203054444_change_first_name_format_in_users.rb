class ChangeFirstNameFormatInUsers < ActiveRecord::Migration[5.0]
  def up
    enable_extension 'citext'

    change_column :participants, :first_name, :citext
    change_column :participants, :last_name, :citext
  end

  def down
    change_column :participants, :first_name, :string
    change_column :participants, :last_name, :string
  end
end

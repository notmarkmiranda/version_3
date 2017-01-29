class Season < ApplicationRecord
  belongs_to :league

  def display_status
    active ? "Active!" : "Inactive"
  end
end

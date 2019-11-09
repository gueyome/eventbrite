class EventValiation < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :validated, :boolean
  end
end

class Admin < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :user, foreign_key: true
    add_reference :events, :admin
  end
end

class AddEventIdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :event_id, :integer
  end
end

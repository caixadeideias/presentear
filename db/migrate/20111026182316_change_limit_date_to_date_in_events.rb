class ChangeLimitDateToDateInEvents < ActiveRecord::Migration
  def up
    change_column :events, :limit_date, :date
  end
  
  def down
    change_column :events, :limit_date, :datetime
  end
end

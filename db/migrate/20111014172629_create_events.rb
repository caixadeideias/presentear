class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :gifted
      t.date :limit_date
      t.string :token
      t.string :type

      t.timestamps
    end
  end
end

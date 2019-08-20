class CreateSpotifies < ActiveRecord::Migration[5.2]
  def change
    create_table :spotifies do |t|

      t.timestamps
    end
  end
end

class CreateLibochaos < ActiveRecord::Migration
  def change
    create_table :libochaos do |t|

      t.timestamps null: false
    end
  end
end

class CreateSnacks < ActiveRecord::Migration
  def change
    create_table :snacks do |t|

      t.references :destination
      t.string :name
      t.integer :individual_price

      t.timestamps
    end
  end
end

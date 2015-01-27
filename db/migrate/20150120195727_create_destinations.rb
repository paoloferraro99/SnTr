class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|

      t.string :name
      t.string :region
      t.string :country

      t.boolean :released, default: false

      t.integer :individual_price

      t.integer :chronological_order

      t.timestamps
    end
  end
end

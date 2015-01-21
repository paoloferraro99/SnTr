class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|

      t.references :user, index: true

      t.string :product_name
      t.integer :product_total
      t.integer :donation_amount
      t.integer :total_amount

      t.string :shipping_address
      t.string :shipping_recipient_last_name
      t.string :shipping_recipient_first_name

      t.timestamps
    end
  end
end

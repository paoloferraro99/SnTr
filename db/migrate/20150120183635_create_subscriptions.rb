class CreateSubscriptions < ActiveRecord::Migrations
  def change
    create_table :subscriptions do |t|

      t.references :user, index: true

      t.string :start_destination
      t.integer :months_subscribed
      t.integer :months_received
      t.integer :months_remaining

      t.string :shipping_addresss
      t.string :shipping_recipient_last_name
      t.string :shipping_recipient_first_names

      t.timestamps
    end
  end
end

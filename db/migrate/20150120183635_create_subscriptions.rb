class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|

      t.references :user, index: true

      t.boolean :primary, default: false

      t.string :start_destination
      t.integer :months_subscribed
      t.integer :months_received
      t.integer :months_remaining

      t.string :shipping_address
      t.string :shipping_recipient_last_name
      t.string :shipping_recipient_first_names

      t.string :current_destination
      t.string :destination_waiting
      t.datetime :send_day



      t.timestamps
    end
  end
end

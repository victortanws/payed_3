class CreatePaymentInformations < ActiveRecord::Migration
  def change
    create_table :payment_informations do |t|
      t.string :cardholder_name
      t.string :card_number
      t.string :card_type
      t.string :cvv
      t.integer :user_id

      t.timestamps

    end
  end
end

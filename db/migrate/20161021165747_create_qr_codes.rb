class CreateQrCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :qr_codes do |t|
      t.text :code
      t.references :event, foreign_key: true
      t.references :participant, foreign_key: true

      t.timestamps
    end
  end
end

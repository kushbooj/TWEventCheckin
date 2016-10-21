class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.text :name
      t.text :email
      t.string :contact_number
      t.text :from
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end

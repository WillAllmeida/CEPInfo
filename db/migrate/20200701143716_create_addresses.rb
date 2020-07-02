class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :cep
      t.string :city
      t.string :uf
      t.string :address
      t.string :district

      t.timestamps
    end
  end
end

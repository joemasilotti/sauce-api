class CreateSauces < ActiveRecord::Migration
  def change
    create_table :sauces do |t|
      t.string :name
      t.string :manufacturer

      t.timestamps
    end
  end
end

class CreateManufacturers < ActiveRecord::Migration
  def up
    create_table :manufacturers do |t|
      t.string :name
      t.timestamps
    end

    remove_column :sauces, :manufacturer
    change_table :sauces do |t|
      t.integer :manufacturer_id
    end
  end

  def down
    drop_table :manufacturers

    remove_column :sauces, :manufacturer_id
    change_table :sauces do |t|
      t.string :manufacturer
    end
  end
end

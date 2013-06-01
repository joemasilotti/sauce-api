class AddManySaucesToManyFlavorsAssociation < ActiveRecord::Migration
  def up
    #rename_column :sauces, :id, :sauce_id
    #rename_column :flavors, :id, :flavor_id
    create_table 'flavors_sauces', :id => false do |t|
      t.column :sauce_id, :integer
      t.column :flavor_id, :integer
    end
  end

  def down
    drop_table 'sauces_flavors'
  end
end

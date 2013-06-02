class AddManySaucesToManyFlavorsAssociation < ActiveRecord::Migration
  def up
    create_table 'flavors_sauces', :id => false do |t|
      t.column :sauce_id, :integer
      t.column :flavor_id, :integer
    end
  end

  def down
    drop_table 'flavors_sauces'
  end
end

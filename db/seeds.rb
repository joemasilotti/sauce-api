Sauce.create(:name => 'Cholula Hot Sauce', :manufacturer => 'Tequila Cuervo La Rojena S.A. de C.V..')
Sauce.create(:name => 'Tabasco Sauce', :manufacturer => 'McIlhenny Company')
Flavor.create(:name => 'spicy')
Flavor.create(:name => 'pungent')
Flavor.create(:name => 'sweet')

Sauce.first.flavors = [ Flavor.first ]
Sauce.last.flavors = [ Flavor.last ]
